//
//  Stack.m
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 4/15/13.
//
//

#import "Stack.h"

@implementation Stack

-(id)init {
    if (self == [super init]) {
        _array = [[NSMutableArray alloc] init];
        _count = 0;
    }
    return self;
}

-(id)pop {
    if (_count > 0 && _array != nil) {
        return [_array lastObject];
        [_array removeLastObject];
    }
    return nil;
}

-(void)push:(id)object {
    if (_array != nil && object != nil) {
        [_array addObject:object];
        _count = _array.count;
    }
}

-(void)clear {
    if (_array != nil) {
        [_array removeAllObjects];
        _count = 0;
    }
}
@end
