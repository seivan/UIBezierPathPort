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
      
      var bezierPath = NSBezierPath()
      bezierPath.moveToPoint(NSMakePoint(170.5, 84.5))
      bezierPath.curveToPoint(NSMakePoint(113.5, 25.5), controlPoint1: NSMakePoint(57.5, 44.5), controlPoint2: NSMakePoint(113.5, 25.5))
      bezierPath.curveToPoint(NSMakePoint(170.5, 84.5), controlPoint1: NSMakePoint(113.5, 25.5), controlPoint2: NSMakePoint(283.5, 124.5))
      bezierPath.closePath()
        let x = bezierPath.CGPath
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
      
        self.addChild(myLabel)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        let location = theEvent.locationInNode(self)
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.position = location;
        sprite.setScale(0.5)
        
        let action = SKAction.rotateByAngle(M_PI, duration:1)
        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
