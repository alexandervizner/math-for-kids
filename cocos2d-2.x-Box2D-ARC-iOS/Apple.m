//
//  Apple.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/11/13.
//
//

#import "Apple.h"

#define MAX_NUMBER 10

// Apple's color enumeration

@implementation Apple

-(id)init{
    
    return [self initWithRandomColor];
}

-(id)initWithRandomColor {
    
}

/*
-(id)initWithColor:(AppleColors*)color {
    
    return [self initWithColor:color tag:101 zOrder:5];
}

-(id)initWithColor:(AppleColors)color tag:(int)t zOrder:(int)order {
    
    // Default color
    int color_shift = 10;
    
    // Construct apple sprite
    if (self == [super initWithFile:@"apple_body.png"]) {
        
        super.zOrder = order;
        super.tag = t;
        self.color = color;
        CGPoint offset = ccp(0, 0);
        
        // Apple components
        CCSprite* apple_shadow = [CCSprite spriteWithFile:@"apple_shadow.png"];
        CCSprite* apple_tile = [CCSprite spriteWithFile:@"apple_tile.png"];
        
        // Set offset of components
        apple_shadow.anchorPoint = offset;
        apple_tile.anchorPoint = ccp(-4, -3);
        
        // Set color of components
        apple_shadow.color = ccc3(color.r + color_shift,
                                  color.g + color_shift,
                                  color.b + color_shift);
        
        // Set order of components
        [self addChild:apple_shadow z:order + 1];
        [self addChild:apple_tile z:order + 2];
        
        isMovable = NO;
        number = random() % MAX_NUMBER;
        
        _label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", number]
                                  dimensions:self.contentSize
                                  hAlignment:kCCTextAlignmentRight
                                    fontName:@"Courier"
                                    fontSize:26.0];
        _label.position = ccp(self.position.x + 10, self.position.y + 10);
        [self addChild:_label];
        [self scheduleUpdate];
    }
    
    return self;
}

- (CCSprite*)getAppleSpriteBy:(AppleColors)color {
    
}

- (void)update:(ccTime)dt
{

}

-(void)setNumber:(int)num {
    _label.string = [NSString stringWithFormat:@"%d", num];
}

*/

@end
