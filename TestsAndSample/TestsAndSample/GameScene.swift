//
//  GameScene.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 15/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//


import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
      let location = theEvent.locationInNode(self)
      var rectangle2Path = UIBezierPath(roundedRect: CGRectMake(105.5, 23.5, 50, 50), byRoundingCorners: UIRectCorner.fromMask(UIRectCorner.TopRight.toRaw() | UIRectCorner.BottomLeft.toRaw()), cornerRadii: CGSizeMake(22, 22))
      rectangle2Path.closePath()
      
      let rectanglePath = UIBezierPath(roundedRect: CGRectMake(27.5, 23.5, 50, 50), cornerRadius: 25)

      
      var ovalRect = CGRectMake(172, 29, 50, 50)
      var ovalPath = UIBezierPath()
      ovalPath.addArcWithCenter(CGPointMake(ovalRect.midX, ovalRect.midY), radius: ovalRect.width / 2, startAngle: (135 * M_PI/180)*10, endAngle: (310 * M_PI/180)*10, clockwise: true)

      let oval2Rect = NSMakeRect(28, -3, 50, 50)
      let oval2Path = UIBezierPath()
      oval2Path.addArcWithCenter(NSMakePoint(NSMidX(oval2Rect), NSMidY(oval2Rect)), radius: NSWidth(oval2Rect) / 2, startAngle: 225, endAngle: 50, clockwise: true)
      
      
      var bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(358.44, 257.44))
      bezierPath.addCurveToPoint(CGPointMake(321.21, 526.77), controlPoint1: CGPointMake(355.78, 260.65), controlPoint2: CGPointMake(480.75, 664.64))
      bezierPath.addCurveToPoint(CGPointMake(273.35, 299.13), controlPoint1: CGPointMake(161.68, 388.9), controlPoint2: CGPointMake(273.35, 299.13))
      bezierPath.addCurveToPoint(CGPointMake(108.5, 299.13), controlPoint1: CGPointMake(273.35, 299.13), controlPoint2: CGPointMake(108.5, 90.72))
      bezierPath.addCurveToPoint(CGPointMake(321.21, 340.81), controlPoint1: CGPointMake(108.5, 507.53), controlPoint2: CGPointMake(321.21, 340.81))
      
      
      var bezierPath2 = UIBezierPath()
      bezierPath2.moveToPoint(CGPointMake(208.44, -63.56))
      bezierPath2.addQuadCurveToPoint(CGPointMake(171.21, 205.77), controlPoint: CGPointMake(205.78, -60.35))
      bezierPath2.addQuadCurveToPoint(CGPointMake(123.35, -21.87), controlPoint: CGPointMake(11.68, 67.9))
      bezierPath2.addQuadCurveToPoint(CGPointMake(-41.5, -21.87), controlPoint: CGPointMake(123.35, -21.87))
      bezierPath2.addQuadCurveToPoint(CGPointMake(171.21, 19.81), controlPoint: CGPointMake(-41.5, 186.53))
      
      

      
      let beziers = [bezierPath, bezierPath2]
      var counter = 0
      for bezier in beziers {
        bezierPath.closePath()
        let sprite = SKShapeNode()
        sprite.path = bezier.CGPath
        beziers
        if(counter == 0) {
          sprite.fillColor = SKColor.redColor()
          sprite.strokeColor = SKColor.blueColor()
          sprite.position = CGPoint(x: 200, y: 300)
          
        }
        else {
          sprite.fillColor = SKColor.greenColor()
          sprite.strokeColor = SKColor.orangeColor()
          sprite.position = location;

        }
        counter += 1

        sprite.setScale(0.5)
        
        let action = SKAction.rotateByAngle(M_PI, duration:1)
//        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)
      }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
