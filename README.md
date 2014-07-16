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
//// Quad Curves
var quadPath = UIBezierPath()
quadPath.moveToPoint(CGPointMake(208.44, -63.56))
quadPath.addQuadCurveToPoint(CGPointMake(171.21, 205.77), controlPoint: CGPointMake(205.78, -60.35))
quadPath.addQuadCurveToPoint(CGPointMake(123.35, -21.87), controlPoint: CGPointMake(11.68, 67.9))
quadPath.addQuadCurveToPoint(CGPointMake(-41.5, -21.87), controlPoint: CGPointMake(123.35, -21.87))
quadPath.addQuadCurveToPoint(CGPointMake(171.21, 19.81), controlPoint: CGPointMake(-41.5, 186.53))


//// Rounded Rectangle 
let rectanglePath = UIBezierPath(roundedRect: CGRectMake(210, 69, 142, 149), cornerRadius: 19)


//// Rectangle
let rectangle2Path = UIBezierPath(rect: CGRectMake(35, 69, 143, 149))


//// Two RoundedCorners Rectangle
var rectangle3Path = UIBezierPath(roundedRect: CGRectMake(408, 69, 142, 149), byRoundingCorners: UIRectCorner.fromMask(UIRectCorner.TopRight.toRaw() | UIRectCorner.BottomLeft.toRaw()), cornerRadii: CGSizeMake(50, 50))
rectangle3Path.closePath()


//// Oval Drawing
var ovalPath = UIBezierPath(ovalInRect: CGRectMake(35, 298, 130, 109))


//// Half Oval 2 Drawing
var oval2Rect = CGRectMake(222, 298, 130, 109)
var oval2Path = UIBezierPath()
oval2Path.addArcWithCenter(CGPointMake(0.0, 0.0), radius: oval2Rect.width / 2, startAngle: -11 * M_PI/180, endAngle: 160 * M_PI/180, clockwise: true)

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