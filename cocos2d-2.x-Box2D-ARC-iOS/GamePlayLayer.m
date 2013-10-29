//
//  GamePlayLayer.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/20/13.
//
//

#import "GamePlayLayer.h"

static float const kMinDistance = 100;
static float const angles[] = {0, 60, 120, 180, 240, 300};
static int const kMaxApplesCount = 7;

static ccColor3B const colors[] = {
    {200, 290, 25},      // red
    {107, 142, 35},      // green
    {255, 255, 0}       // yellow
    };

@implementation GamePlayLayer

-(id)init {
    
    if (self == [super init]) {
        
        _applesPool = [[NSMutableArray alloc] init];
        _bPath = [UIBezierPath bezierPathWithRect:CGRectMake(150, 280, 600, 550)];
         _treeCentralPoint = ccp(375, 415);
        
        [self configureScene];
        [self initApplesPool];
        [self startGameLevel];
    }
    
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                              priority:0
                                                       swallowsTouches:YES];
    
    return self;
}

-(void)configureScene {
    
    NSLog(@"configureScene: Configuring game scene.");
    
    _basket = [[Basket alloc] init];
    [_basket setPosition:ccp(790, 185)];
    [_basket setNumber:arc4random() % 50];
    [self addChild:_basket z:2];
   }

-(void)initApplesPool {
    
    NSLog(@"Recreating apples pool.");
    [_applesPool removeAllObjects];
    
    for (int i = 0; i < kMaxApplesCount; i++) {
        
        //NSArray* resApplePics = [[NSArray alloc] init];
        NSString* imageFolderPath = [[NSBundle mainBundle] resourcePath];
        NSFileManager* imageFileManager = [NSFileManager defaultManager];
        NSEnumerator* resApplePics = [imageFileManager enumeratorAtPath:imageFolderPath];
        
        for (NSString *filePath in resApplePics) {
            if ([imageFileManager fileExistsAtPath:filePath] ) {
                NSLog(@"%@", [filePath pathExtension]);
            }
        }
        /*
        Apple* apple = [[Apple alloc] initWithColor:colors[rand() % 3] tag:i zOrder:2];
        [apple setNumber:i];
        
        NSLog(@"initApplesPool: generating new apple with random position.");
        apple.position = [self getRandomPoint];
            
        [_applesPool addObject:apple];
         */
    }
}

-(void)startGameLevel {
    
    for (int i = 0; i < _applesPool.count; i++) {
        [self addChild:_applesPool[i]];
    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    _movableApple = [self getAppleForTouch:touchLocation];
    NSLog(@"ccTouchBegan - X: %f, Y: %f", touchLocation.x, touchLocation.y);
    return TRUE;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
    if (_movableApple != nil) _movableApple.position = ccpAdd(_movableApple.position, translation);
    
    CGRect rect_0 = CGRectMake(_movableApple.position.x,
                                _movableApple.position.y,
                                _movableApple.boundingBox.size.width,
                                _movableApple.boundingBox.size.height);
    CGRect rect_1 = CGRectMake(_basket.position.x,
                               _basket.position.y,
                               _basket.boundingBox.size.width,
                               _basket.boundingBox.size.height);
    
    if (CGRectContainsRect(rect_1, rect_0)) {
        NSLog(@"Apple id: %ld intersects with basket.", (long)_movableApple.tag);
    }
}

-(Apple*)getAppleForTouch:(CGPoint)touchLocation {
    
    Apple* ret = nil;
    for (Apple *apple in _applesPool) {
        if(CGRectContainsPoint(apple.boundingBox, touchLocation)) {
            NSLog(@"Getting apple - id: %d, width: %f, heigth: %f", apple.tag, ret.boundingBox.size.width, ret.boundingBox.size.height);
            ret = apple;
        }
    }    
    
    return ret;
}

-(CGPoint)getRandomPointWithinPath:(UIBezierPath*)shape {
    
    CGPoint randomPoint;
    
    do {
        randomPoint = ccp( arc4random() % (int) shape.bounds.size.height,
                          arc4random() % (int) shape.bounds.size.width);
    } while (![shape containsPoint:randomPoint]);
    
    return randomPoint;
}

-(CGPoint)getPointWithDistance:(float)distance underAngle:(float)angle {
    
    float angleInRadians = CC_DEGREES_TO_RADIANS(angle);
    return ccp(_treeCentralPoint.x + distance * cosf(angleInRadians),
               _treeCentralPoint.y - distance * sin(angleInRadians));
}

-(CGPoint)getPointAtDistance:(float)distance atAngle:(float)angle fromBasePoint:(CGPoint)point {
    
    CGPoint ret;
    float angleInRadians = CC_DEGREES_TO_RADIANS(angle);
    
    if (distance > 0 && angle >= 0 && point.x >=0) {
        ret = ccp(point.x + distance * cosf(angleInRadians),
                  point.y - distance * sinf(angleInRadians));        
    }
    
    return ret;
}

-(CGPoint)getNextRandomPoint {
    
    CGPoint initPoint = [self getRandomPointWithinPath:_bPath];
    CGPoint ret;
    
    do {
        ret = [self getPointAtDistance:kMinDistance
                               atAngle:arc4random() % 360 + 1
                         fromBasePoint:initPoint];
    } while (![_bPath containsPoint:ret]);
    
    return ret;
}

// Returns random point within _bPath with distance equals or more then kMinDistance
-(CGPoint)getRandomPoint {

    CGPoint retPoint;
    
    if (_applesPool.count == 0)
        return [self getRandomPointWithinPath:_bPath];
    
    for (Apple *apple in _applesPool) {
        
        do {
            
            retPoint = [self getRandomPointWithinPath:_bPath];
            NSLog(@"getRandomPoint: generating point (%.1f, %.1f)", retPoint.x, retPoint.y);
            
        } while (![self is:retPoint toCloseTo:apple.position]);
        
        continue;
    }
    
    return retPoint;
}

-(CGPoint)getRandomPointWithinPath:(UIBezierPath*)shape withMinDistance:(float)distance{
    
    CGPoint point = [self getRandomPointWithinPath:shape];
    if ((_applesPool.count == 0)) {
        return point;
    }
    
    do {
        point = [self getRandomPointWithinPath:shape];
    } while ([self GetClosestPointTo:point] < distance);
    
    return point;
}

// Checks if distance between point1 and point2 less then kMinDistance 
-(BOOL)is:(CGPoint)point1 toCloseTo:(CGPoint)point2 {
    
    return kMinDistance > [self getDistanceBetween:point1 and:point2];
}

// Returns distance between point1 and point2
-(float)getDistanceBetween:(CGPoint)point1 and:(CGPoint)point2 {
        
    float dist_x = point1.x - point2.x;
    float dist_y = point1.y - point2.y;
    
    return sqrt(dist_x * dist_x + dist_y * dist_y);
}

-(float)GetClosestPointTo:(CGPoint)point {
    
    float distance = 0;
    if (&point != nil) {
        for (Apple *apple in _applesPool) {
            float dist_x = point.x - apple.position.x;
            float dist_y = point.y - apple.position.y;
            distance = sqrt(dist_x * dist_x + dist_y * dist_y);
        }
    }

    return distance;
}

-(void)GetLineThroughShape:(CGPoint)basePoint {
    
    CGPoint rigthPoint = basePoint;
    while ([_bPath containsPoint:rigthPoint]) {
        rigthPoint = ccp(rigthPoint.x + 1, rigthPoint.y);
    }
    NSLog(@"Point 1 - x: %f, y: %f", rigthPoint.x, rigthPoint.y);
    
    CGPoint leftPoint = basePoint;
    while ([_bPath containsPoint:leftPoint]) {
        leftPoint = ccp(leftPoint.x - 1, leftPoint.y);
    }
    NSLog(@"Point 2 - x: %f, y: %f", leftPoint.x, leftPoint.y);
    
    float length = rigthPoint.x - leftPoint.x;
    NSLog(@"Line length: %f", length);
    ccDrawLine(leftPoint, rigthPoint);
}

- (void)notify:(NSNotification *)notification {
	id notificationSender = [notification object];
    if (notificationSender != nil) {
        NSLog(@"notify: %@", notification.name);
        
    }
}

@end
