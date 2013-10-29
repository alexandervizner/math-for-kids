//
//  GameScene.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/20/13.
//
//

#import "GameScene.h"

@implementation GameScene

- (id)init
{
    if (self == [super init]) {
        
        BackgroundLayer *bgrdLayer = [BackgroundLayer node];
        [self addChild:bgrdLayer z:0];
        
        GamePlayLayer *gamePlay = [GamePlayLayer node];
        [self addChild:gamePlay z:5];
    }
    return self;
}

@end
