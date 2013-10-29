//
//  Object.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/10/13.
//
//

#import "CCSprite.h"

@interface Object : CCSprite {
    CGPathRef _activeArea;
}

@property CGPathRef ActiveArea;

-(CGPoint*)getRandomPointWithinActiveArea;

@end
