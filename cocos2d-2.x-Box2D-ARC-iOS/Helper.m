//
//  Helper.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/9/13.
//
//

#import "Helper.h"

@implementation Helper

- (CCControlButton *)standardButtonWithTitle:(NSString *)title
{
    /** Creates and return a button with a default background and title color. */
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"CCControlButton.png"];
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:title fontName:@"Helvetica" fontSize:30];
    [titleButton setColor:ccBLACK];
    
    return [CCControlButton buttonWithLabel:titleButton backgroundSprite:backgroundButton];
}

@end
