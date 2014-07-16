//
//  TestsAndSampleTests.swift
//  TestsAndSampleTests
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import Cocoa
import XCTest

class TestsAndSampleTests: XCTestCase {
  var bezier:UIBezierPath?
  let rect:CGRect! = CGRect(x: 0, y: 0, width: 100, height: 100)
  let point:CGPoint! = CGPoint(x: 300, y: 300)
    
  func testRoundedRectCornerRadius() {
//    init(roundedRect rect: NSRect, cornerRadius: CGFloat)
    self.bezier = UIBezierPath(roundedRect: rect, cornerRadius: 20)
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
    XCTAssertEqual(CGPathGetBoundingBox(self.bezier?.CGPath), self.rect)
  }

  func testRoundedRectbyRoundingCorners() {
    // convenience init(roundedRect rect: NSRect, byRoundingCorners corners: UIRectCorner, cornerRadii: NSSize)
    self.bezier = UIBezierPath(roundedRect: self.rect, byRoundingCorners: .AllCorners, cornerRadii: NSSize(width: 20, height: 20))
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
    XCTAssertEqual(CGPathGetBoundingBox(self.bezier?.CGPath), self.rect)
  }

  func testArcCenter() {
    //init(arcCenter center: NSPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)
    self.bezier = UIBezierPath(arcCenter: NSPoint(x: 1, y: 1), radius: self.rect.width/2, startAngle: 100, endAngle: 300, clockwise: true)
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
  }

  func testWithPath() {
    //init(CGPath:CGPath)
    var path = CGPathCreateMutable()
    CGPathAddEllipseInRect(path, nil, self.rect)
    CGPathAddRect(path, nil, self.rect)
    CGPathCloseSubpath(path)
    self.bezier = UIBezierPath(CGPath: path)
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
    //For some reason this is not true
//    XCTAssertTrue(CGPathEqualToPath(path, self.bezier!.CGPath))
  }
  
  func testAddLineToPoint() {
    self.bezier = UIBezierPath(ovalInRect: self.rect)
    self.bezier?.addLineToPoint(self.point)
    XCTAssertTrue(CGPathContainsPoint(self.bezier?.CGPath, nil, self.point, true));
  }

  func testAddCurveToPoint() {
    self.bezier = UIBezierPath(rect: self.rect)
    self.bezier?.addCurveToPoint(self.point, controlPoint1: self.point, controlPoint2: self.point)
    XCTAssertTrue(CGPathContainsPoint(self.bezier?.CGPath, nil, self.point, true));
  }
  
  func testAddQuadCurveToPoint() {
    self.bezier = UIBezierPath(arcCenter: NSPoint(x: 1, y: 1), radius: self.rect.width/2, startAngle: 100, endAngle: 300, clockwise: true)
    self.bezier?.addQuadCurveToPoint(self.point, controlPoint: self.point)
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
    XCTAssertTrue(CGPathContainsPoint(self.bezier?.CGPath, nil, self.point, true));

  }
  
  func testAppendPath() {
    self.bezier = UIBezierPath(rect: self.rect)
    let otherBezier = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 300, height: 300))
    self.bezier?.appendPath(otherBezier)
    XCTAssertNotNil(self.bezier?)
    XCTAssertFalse(CGPathIsEmpty(self.bezier?.CGPath))
    XCTAssertTrue(CGPathContainsPoint(self.bezier?.CGPath, nil, self.point, true));
    
  }

}





