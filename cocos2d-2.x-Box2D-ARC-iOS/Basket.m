//
//  Basket.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/28/13.
//
//

#import "Basket.h"

@implementation Basket

-(id)init {
    
    if (self == [super initWithFile:@"basket.png"]) {
        
        _number = 5;
        _label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _number]
                                  dimensions:self.contentSize
                                  hAlignment:kCCTextAlignmentRight
                                    fontName:@"Courier"
                                    fontSize:36.0];
        
        [_label setPosition:ccp(self.position.x + 25, self.position.y - 70)];
        [self addChild:_label];
    }
    return self;
}

-(void)setNumber:(int)num {
    _label.string = [NSString stringWithFormat:@"%d", num];
}

- (void)update:(ccTime)dt
{
    
}

@end
