//#if os(OSX)
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
typealias UIBezierPath = NSBezierPath

extension NSBezierPath {
  var CGPath : CGPathRef! {
  get {
    var cgPath = CGPathCreateMutable()
    var points = NSPointArray.alloc(3)
    for i in 0..<elementCount {
      let pathEl = elementAtIndex(i, associatedPoints: points)
      switch pathEl {
      case .MoveToBezierPathElement: CGPathMoveToPoint(cgPath, nil, points[0].x, points[0].y)
      case .LineToBezierPathElement: CGPathAddLineToPoint(cgPath, nil, points[0].x, points[0].y)
      case .CurveToBezierPathElement: CGPathAddCurveToPoint(cgPath, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
      case .ClosePathBezierPathElement: CGPathCloseSubpath(cgPath)
      }
    }
    points.dealloc(3)
    return cgPath as CGPathRef
  }
  }
  // rounds all corners with the same horizontal and vertical radius
  convenience init(roundedRect rect: CGRect, cornerRadius: CGFloat) {
    self.init(roundedRect:rect, xRadius:cornerRadius, yRadius: cornerRadius)

  }
  
  convenience init(roundedRect rect: CGRect, byRoundingCorners corners: UIRectCorner, cornerRadii: CGSize) {
    var path = CGPathCreateMutable();
    
    let topLeft = rect.origin;
    let topRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
    let bottomRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    let bottomLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
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
    
    self.init()
    
  }
  
  //    convenience init(arcCenter center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
  //
  //    }
  
  convenience init(CGPath: CGPathRef!) {
    self.init()
//    __SHBezierPathInternalExtension.bezierPathWithPath(CGPath, onBezier: self)
  }
  
}

//#endif
  