//
//  AppDelegate.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import Cocoa
import CoreGraphics
import QuartzCore
class AppDelegate: NSObject, NSApplicationDelegate {
                            
  @IBOutlet var window: NSWindow


  func applicationDidFinishLaunching(aNotification: NSNotification?) {
    // Insert code here to initialize your application
    let shape = CAShapeLayer()
    shape.backgroundColor = NSColor.redColor().CGColor
    shape.fillColor = NSColor.blueColor().CGColor

    var bezierPath = NSBezierPath()
    bezierPath.moveToPoint(NSMakePoint(170.5, 84.5))
    bezierPath.curveToPoint(NSMakePoint(113.5, 25.5), controlPoint1: NSMakePoint(57.5, 44.5), controlPoint2: NSMakePoint(113.5, 25.5))
    bezierPath.curveToPoint(NSMakePoint(170.5, 84.5), controlPoint1: NSMakePoint(113.5, 25.5), controlPoint2: NSMakePoint(283.5, 124.5))
    bezierPath.closePath()
    
    shape.path = bezierPath.CGPath
    let view = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    view.layer = shape
    
    self.window.contentView.addSubview(view)
  }

  func applicationWillTerminate(aNotification: NSNotification?) {
    // Insert code here to tear down your application
  }


}

