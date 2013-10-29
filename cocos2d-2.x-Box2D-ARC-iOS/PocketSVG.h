//
//  PocketSVG.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 2/21/13.
//
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

@interface PocketSVG : NSObject
{
    @private
	float			pathScale;
#if TARGET_OS_IPHONE
	UIBezierPath    *bezier;
#else
	NSBezierPath    *bezier;
#endif

	CGPoint			lastPoint;
	CGPoint			lastControlPoint;
	BOOL			validLastControlPoint;
	NSCharacterSet  *separatorSet;
	NSCharacterSet  *commandSet;
    NSMutableArray  *tokens;
}

#if TARGET_OS_IPHONE
@property(nonatomic, readonly) UIBezierPath *bezier;
#else
@property(nonatomic, readonly) NSBezierPath *bezier;
#endif

- (id)initFromSVGFileNamed:(NSString *)nameOfSVG;

#if !TARGET_OS_IPHONE
+ (CGPathRef)getCGPathFromNSBezierPath:(NSBezierPath *)quartzPath;
#endif

@end
