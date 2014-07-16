## UIBezierPathPort

### Overview
An extension on ```NSBezierPath``` (OS X) to mimic some of ```UIBezierPath``` (iOS) public interface.
Most notabily adding QuadCurves and ```CGPath``` property (getter and setter) amongst others



### Usage

##### API
```swift
  var CGPath:CGPathRef! {get set}
  init()
  init(roundedRect rect: NSRect, cornerRadius: CGFloat)
  init(roundedRect rect: NSRect, byRoundingCorners corners: UIRectCorner, cornerRadii: NSSize)
  init(arcCenter center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)
  init(CGPath: CGPathRef!)
  func addLineToPoint(point: NSPoint)
  func addCurveToPoint(endPoint: NSPoint, controlPoint1: NSPoint, controlPoint2: NSPoint)
  func addQuadCurveToPoint(endPoint: NSPoint, controlPoint: NSPoint)
  func addArcWithCenter(center: NSPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)
  func appendPath(path: NSBezierPath!)
```

##### Sample
```swift
  //// Oval Drawing
    var ovalRect = CGRectMake(0, 279, 150, 150)
    var ovalPath = UIBezierPath()
    ovalPath.addArcWithCenter(CGPointMake(ovalRect.midX, ovalRect.midY), radius: ovalRect.width / 2, startAngle: -33 * M_PI/180, endAngle: 33 * M_PI/180, clockwise: false)
    ovalPath.addLineToPoint(CGPointMake(ovalRect.midX, ovalRect.midY))
    ovalPath.closePath()
    
    
    
    //// Polygon Drawing
    var polygonPath = UIBezierPath()
    polygonPath.moveToPoint(CGPointMake(200, 301))
    polygonPath.addLineToPoint(CGPointMake(243.3, 276))
    polygonPath.addLineToPoint(CGPointMake(243.3, 226))
    polygonPath.addLineToPoint(CGPointMake(200, 201))
    polygonPath.addLineToPoint(CGPointMake(156.7, 226))
    polygonPath.addLineToPoint(CGPointMake(156.7, 276))
    polygonPath.closePath()
    
    
    //// Star Drawing
    var starPath = UIBezierPath()
    starPath.moveToPoint(CGPointMake(284, 207))
    starPath.addLineToPoint(CGPointMake(299, 182.98))
    starPath.addLineToPoint(CGPointMake(327.3, 182))
    starPath.addLineToPoint(CGPointMake(314, 157))
    starPath.addLineToPoint(CGPointMake(327.3, 132))
    starPath.addLineToPoint(CGPointMake(299, 131.02))
    starPath.addLineToPoint(CGPointMake(284, 107))
    starPath.addLineToPoint(CGPointMake(269, 131.02))
    starPath.addLineToPoint(CGPointMake(240.7, 132))
    starPath.addLineToPoint(CGPointMake(254, 157))
    starPath.addLineToPoint(CGPointMake(240.7, 182))
    starPath.addLineToPoint(CGPointMake(269, 182.98))
    starPath.closePath()
    
    
    //// Star 2 Drawing

      var star2Path = UIBezierPath()
      star2Path.moveToPoint(CGPointMake(200, 529))
      star2Path.addQuadCurveToPoint(CGPointMake(212.99, 492.71), controlPoint: CGPointMake(206.5, 529))
      star2Path.addQuadCurveToPoint(CGPointMake(249.91, 490.97), controlPoint: CGPointMake(212.99, 492.71))
      star2Path.addQuadCurveToPoint(CGPointMake(221.02, 466.8), controlPoint: CGPointMake(251.91, 484.49))
      star2Path.addQuadCurveToPoint(CGPointMake(230.84, 429.43), controlPoint: CGPointMake(221.02, 466.8))
      star2Path.addQuadCurveToPoint(CGPointMake(200, 450.78), controlPoint: CGPointMake(225.59, 425.42))
      star2Path.addQuadCurveToPoint(CGPointMake(169.16, 429.43), controlPoint: CGPointMake(200, 450.78))
      star2Path.addQuadCurveToPoint(CGPointMake(178.98, 466.8), controlPoint: CGPointMake(163.9, 433.43))
      star2Path.addQuadCurveToPoint(CGPointMake(150.09, 490.97), controlPoint: CGPointMake(178.98, 466.8))
      star2Path.addQuadCurveToPoint(CGPointMake(187.01, 492.71), controlPoint: CGPointMake(152.1, 497.45))
      star2Path.addQuadCurveToPoint(CGPointMake(200, 529), controlPoint: CGPointMake(187.01, 492.71))
      star2Path.closePath()

    
    //// Oval 2 Drawing
    var oval2Path = UIBezierPath(ovalInRect: CGRectMake(321, 16, 100, 100))
    
    
    //// Rectangle 2 Drawing
    let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(401, 578, 100, 100), cornerRadius: 5)
    
    
    //// Rectangle Drawing
    var rectanglePath = UIBezierPath(roundedRect: CGRectMake(272, 503, 100, 100), byRoundingCorners: UIRectCorner.fromMask(UIRectCorner.TopRight.toRaw() | UIRectCorner.BottomLeft.toRaw()), cornerRadii: CGSizeMake(50, 50))
    rectanglePath.closePath()

``` 





###Contact

If you end up using UIBezierPathPort in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

***

### Credit
[Sean Heber](http://twitter.com/BigZaphod) for the Chameleon project - We have different implementations but the idea is the same. 

### License

UIBezierPathPort is © 2014 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/seivan/UIBezierPathPort/blob/master/LICENSE.md) file.

*** 