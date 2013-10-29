//
//  GamePlayLayer.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/20/13.
//
//

#import <Foundation/Foundation.h>
#import "CCSprite+Scale.h"
#import "cocos2d.h"
#import "Apple.h"
#import "Basket.h"
#import "Colors.h"
#import "Stack.h"
#import "Observer.h"

@interface GamePlayLayer : CCLayer {
    CCSprite*       _appleTree;
    Basket*         _basket;
    UIBezierPath*   _bPath;
    CGPoint         _treeCentralPoint;
    NSMutableArray* _applesPool;
    Apple*          _movableApple;
}

-(id) init;
-(void)configureScene;
-(void)initApplesPool;
-(void)startGameLevel;

@end
