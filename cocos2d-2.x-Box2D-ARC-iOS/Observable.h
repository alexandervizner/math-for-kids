//
//  Observable.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 4/15/13.
//
//

#import <Foundation/Foundation.h>

@protocol Observable <NSObject>

-(void)notify:(NSNotification*)notification;

@end
