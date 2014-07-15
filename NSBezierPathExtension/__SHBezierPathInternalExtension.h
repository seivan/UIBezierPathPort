//
//  __SHBezierPathInternalExtension.h
//  TestsAndSample
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NSBezierPath;
@interface __SHBezierPathInternalExtension : NSObject
+(void)bezierPathWithPath:(CGPathRef)thePath onBezier:(NSBezierPath *)theBezierPath;
@end
