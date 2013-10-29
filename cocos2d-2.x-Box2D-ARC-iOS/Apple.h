//
//  Apple.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/11/13.
//
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface Apple : CCSprite {
    CGRect box;
    int number;
    BOOL isMovable;
    CCLabelTTF* _label;
}

-(id)init;
/*
-(id)initWithColor:(AppleColors)color;
-(id)initWithColor:(AppleColors)color tag:(int)t zOrder:(int)order;
-(void)update:(ccTime)dt;
-(void)setNumber:(int)num;
 */

@end
