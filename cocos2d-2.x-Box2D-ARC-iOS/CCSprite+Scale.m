//
//  CCSprite+Scale.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/20/13.
//
//

#import "CCSprite+Scale.h"

@implementation CCSprite (Scale)

-(void) scaleProportionaly:(float) rate
{
    [self setScaleX: rate];
    [self setScaleY: rate];
}

@end
