#if os(OSX)
import Cocoa
struct NSRectCorner : RawOptionSet {
  var value: UInt = 0
  init(_ value: UInt) { self.value = value }
  func toRaw() -> UInt { return self.value }
  func getLogicValue() -> Bool { return self.value != 0 }
  static func fromRaw(raw: UInt) -> NSRectCorner? { return self(raw) }
  static func fromMask(raw: UInt) -> NSRectCorner { return self(raw) }
  static func convertFromNilLiteral() -> NSRectCorner { return self(0) }
  
  static var None: NSRectCorner { return self(0) }
  static var TopLeft: NSRectCorner { return NSRectCorner(1 << 0) }
  static var TopRight: NSRectCorner { return NSRectCorner(1 << 1) }
  static var BottomLeft: NSRectCorner { return NSRectCorner(1 << 2) }
  static var BottomRight: NSRectCorner { return NSRectCorner(1 << 3) }
  static var AllCorners: NSRectCorner { return NSRectCorner(1 << 4) }
}

typealias UIRectCorner = NSRectCorner
//typealias UIBezierPath = NSBezierPath


protocol NSBezierPathExtension {
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
}

//extension NSBezierPath {
class UIBezierPath : NSBezierPath, NSBezierPathExtension {
  
  var CGPath : CGPathRef! {
  get {
    var path = CGPathCreateMutable()
    var points = NSPointArray.alloc(3)
//    var isClosed = false
    
    for index in 0..<self.elementCount {
      let pathType = self.elementAtIndex(index, associatedPoints: points)
      switch pathType {
      case .MoveToBezierPathElement: CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
      case .LineToBezierPathElement: CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
      case .CurveToBezierPathElement: CGPathAddCurveToPoint(path, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
      case .ClosePathBezierPathElement: CGPathCloseSubpath(path)
      }
    }
    //Might want to close here manually.
    points.dealloc(3)
    return path
  }
  set {
    if let newPath = newValue {
      __SHBezierPathInternalExtension.bezierPathWithPath(newPath, onBezier: self)
    }
    else {
      __SHBezierPathInternalExtension.bezierPathWithPath(CGPathCreateMutable(), onBezier: self)
    }
  }
  }

  //Should not be necessary, we should be able inherit the init
  init() {
    super.init()
  }
  

  convenience init(roundedRect rect: NSRect, cornerRadius: CGFloat) {
    self.init(roundedRect:rect, byRoundingCorners:.AllCorners, cornerRadii:NSSize(width: cornerRadius, height: cornerRadius))
  }


  convenience init(roundedRect rect: NSRect, byRoundingCorners corners: UIRectCorner, cornerRadii: NSSize) {
    var path = CGPathCreateMutable();
    
    let topLeft = rect.origin;
    let topRight = NSPoint(x: CGRectGetMaxX(rect), y: CGRectGetMinY(rect));
    let bottomRight = NSPoint(x: CGRectGetMaxX(rect), y: CGRectGetMaxY(rect));
    let bottomLeft = NSPoint(x: CGRectGetMinX(rect), y: CGRectGetMaxY(rect));
    
    if (corners & .TopLeft) {
      CGPathMoveToPoint(path, nil, topLeft.x+cornerRadii.width, topLeft.y);
    } else {
      CGPathMoveToPoint(path, nil, topLeft.x, topLeft.y);
    }
    
    if (corners & .TopRight) {
      CGPathAddLineToPoint(path, nil, topRight.x-cornerRadii.width, topRight.y);
      CGPathAddCurveToPoint(path, nil, topRight.x, topRight.y, topRight.x, topRight.y+cornerRadii.height, topRight.x, topRight.y+cornerRadii.height);
    } else {
      CGPathAddLineToPoint(path, nil, topRight.x, topRight.y);
    }
    
    if (corners & .BottomRight) {
      CGPathAddLineToPoint(path, nil, bottomRight.x, bottomRight.y-cornerRadii.height);
      CGPathAddCurveToPoint(path, nil, bottomRight.x, bottomRight.y, bottomRight.x-cornerRadii.width, bottomRight.y, bottomRight.x-cornerRadii.width, bottomRight.y);
    } else {
      CGPathAddLineToPoint(path, nil, bottomRight.x, bottomRight.y);
    }
    
    if (corners & .BottomLeft) {
      CGPathAddLineToPoint(path, nil, bottomLeft.x+cornerRadii.width, bottomLeft.y);
      CGPathAddCurveToPoint(path, nil, bottomLeft.x, bottomLeft.y, bottomLeft.x, bottomLeft.y-cornerRadii.height, bottomLeft.x, bottomLeft.y-cornerRadii.height);
    } else {
      CGPathAddLineToPoint(path, nil, bottomLeft.x, bottomLeft.y);
    }
    
    if (corners & .TopLeft) {
      CGPathAddLineToPoint(path, nil, topLeft.x, topLeft.y+cornerRadii.height);
      CGPathAddCurveToPoint(path, nil, topLeft.x, topLeft.y, topLeft.x+cornerRadii.width, topLeft.y, topLeft.x+cornerRadii.width, topLeft.y);
    } else {
      CGPathAddLineToPoint(path, nil, topLeft.x, topLeft.y);
    }
    
    CGPathCloseSubpath(path);
    self.init(CGPath:path)
    
    
  }
  
  convenience init(arcCenter center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
    self.init()
    self.addArcWithCenter(center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
  }
  
  convenience init(CGPath: CGPathRef!) {
    self.init()
    self.CGPath = CGPath
  }
  
  
  func addLineToPoint(point: NSPoint) {
    self.lineToPoint(point)
  }
  
  func addCurveToPoint(endPoint: NSPoint, controlPoint1: NSPoint, controlPoint2: NSPoint) {
    self.curveToPoint(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
  }
  
  func addQuadCurveToPoint(endPoint: NSPoint, controlPoint: NSPoint) {
//    let path = CGPathCreateMutableCopy(self.CGPath)
//    CGPathAddQuadCurveToPoint(path, nil, endPoint.x, endPoint.y, controlPoint.x, controlPoint.y)
//    self.CGPath = path
    
    
    var QP0 = self.currentPoint;
    var CP3 = endPoint;
    
    var CP1 = CGPointMake(
      //  QP0   +   2   / 3    * (QP1   - QP0  )
      QP0.x + ((2.0 / 3.0) * (controlPoint.x - QP0.x)),
      QP0.y + ((2.0 / 3.0) * (controlPoint.y - QP0.y))
    );
    
    var CP2 = CGPointMake(
      //  QP2   +  2   / 3    * (QP1   - QP2)
      endPoint.x + (2.0 / 3.0) * (controlPoint.x - endPoint.x),
      endPoint.y + (2.0 / 3.0) * (controlPoint.y - endPoint.y)
    );
    self.addCurveToPoint(CP3, controlPoint1: CP1, controlPoint2: CP2)
  }

  func addArcWithCenter(center: NSPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
    //self.appendBezierPathWithArcWithCenter(center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
    let path = CGPathCreateMutableCopy(self.CGPath)
    CGPathAddArc(path, nil, center.x, center.y, radius, startAngle, endAngle, clockwise)
    self.CGPath = path
    
  }
  
  func appendPath(path: NSBezierPath!) {
    self.appendBezierPath(path)
  }

  
}

#endif
  