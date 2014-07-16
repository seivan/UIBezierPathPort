//
//  __SHBezierPathInternalExtension.h
//  TestsAndSample
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_MAC
@class NSBezierPath;
@interface __SHBezierPathInternalExtension : NSObject
+(void)bezierPathWithPath:(CGPathRef)thePath onBezier:(NSBezierPath *)theBezierPath;
@end
#endif