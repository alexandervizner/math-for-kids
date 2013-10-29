//
//  Stack.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 4/15/13.
//
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
    NSMutableArray *_array;
    NSInteger _count;
}

-(id)init;
-(id)pop;
-(void)push:(id)object;
-(void)clear;

@end
