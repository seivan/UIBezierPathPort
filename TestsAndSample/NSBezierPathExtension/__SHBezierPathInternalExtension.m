//
//  __SHBezierPathInternalExtension.m
//  TestsAndSample
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

#import "__SHBezierPathInternalExtension.h"
#import <AppKit/AppKit.h>
@implementation __SHBezierPathInternalExtension
static void __CGPathCallback(void *info, const CGPathElement *element)
{
  NSBezierPath *path = (__bridge NSBezierPath *)(info);
  CGPoint *points = element->points;
  
  switch (element->type) {
    case kCGPathElementMoveToPoint:
    {
      [path moveToPoint:NSMakePoint(points[0].x, points[0].y)];
      break;
    }
    case kCGPathElementAddLineToPoint:
    {
      [path lineToPoint:NSMakePoint(points[0].x, points[0].y)];
      break;
    }
    case kCGPathElementAddQuadCurveToPoint:
    {
      NSPoint currentPoint = [path currentPoint];
      NSPoint interpolatedPoint = NSMakePoint((currentPoint.x + 2*points[0].x) / 3, (currentPoint.y + 2*points[0].y) / 3);
      [path curveToPoint:NSMakePoint(points[1].x, points[1].y) controlPoint1:interpolatedPoint controlPoint2:interpolatedPoint];
      
      break;
    }
    case kCGPathElementAddCurveToPoint:
    {
      [path curveToPoint:NSMakePoint(points[2].x, points[2].y) controlPoint1:NSMakePoint(points[0].x, points[0].y) controlPoint2:NSMakePoint(points[1].x, points[1].y)];
      break;
    }
    case kCGPathElementCloseSubpath:
    default:
    {
      [path closePath];
      break;
    }
  }
}

+(void)bezierPathWithPath:(CGPathRef)thePath onBezier:(NSBezierPath *)theBezierPath; {
  CGPathApply(thePath, (__bridge void *)(theBezierPath), __CGPathCallback);
}
@end
