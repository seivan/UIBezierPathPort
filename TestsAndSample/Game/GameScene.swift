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
  
  func eventOnCGPoint(location:CGPoint) {
    var bezierPath2 = UIBezierPath()
    bezierPath2.moveToPoint(CGPointMake(208.44, -63.56))
    bezierPath2.addQuadCurveToPoint(CGPointMake(171.21, 205.77), controlPoint: CGPointMake(205.78, -60.35))
    bezierPath2.addQuadCurveToPoint(CGPointMake(123.35, -21.87), controlPoint: CGPointMake(11.68, 67.9))
    bezierPath2.addQuadCurveToPoint(CGPointMake(-41.5, -21.87), controlPoint: CGPointMake(123.35, -21.87))
    bezierPath2.addQuadCurveToPoint(CGPointMake(171.21, 19.81), controlPoint: CGPointMake(-41.5, 186.53))
    
    
    let beziers = [bezierPath2]
    var counter = 0
    for bezier in beziers {
      bezier.closePath()
      let sprite = SKShapeNode()
      sprite.path = bezier.CGPath
      beziers
      if(counter == 0) {
        sprite.fillColor = SKColor.redColor()
        sprite.strokeColor = SKColor.blueColor()
        
      }
      else {
        sprite.fillColor = SKColor.greenColor()
        sprite.strokeColor = SKColor.orangeColor()
      }
      sprite.position = location;
      counter += 1
      
      sprite.setScale(0.5)
      
      let action = SKAction.rotateByAngle(M_PI, duration:1)
      //        sprite.runAction(SKAction.repeatActionForever(action))
      
      self.addChild(sprite)
    }

  }
  
  
#if os(iOS)
   override func touchesEnded(touches:NSSet, withEvent:UIEvent) {
  
        let withEvent:UITouch = touches.allObjects[0] as UITouch
        let location = withEvent.locationInNode(self)
        self.eventOnCGPoint(location)
  
    }
#endif

#if os(OSX)
  override func mouseDown(theEvent: NSEvent) {
    let location = theEvent.locationInNode(self)
    self.eventOnCGPoint(location)
}
#endif

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
