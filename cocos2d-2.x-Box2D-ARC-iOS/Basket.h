//
//  Basket.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/28/13.
//
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface Basket : CCSprite {
    int _number;
    CCLabelTTF* _label;
}

-(id)init;
-(void)setNumber:(int)num;

@end
