//
//  BackgroundLayer.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/20/13.
//
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

-(id)init {
    CCSprite *backgroundImage;
    if (self == [super init])
    {
        backgroundImage = [CCSprite spriteWithFile:@"background.png"];
        backgroundImage.anchorPoint = ccp(0, 0);
        backgroundImage.position = ccp(0, 0);
        [self addChild:backgroundImage z:0 tag:0];
    }
    
    return self;
}

@end
