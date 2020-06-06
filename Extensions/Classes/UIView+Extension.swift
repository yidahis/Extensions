//
//  UIView+Extension.swift
//  Sports
//
//  Created by Asteroid on 2017/4/18.
//  Copyright © 2017年 Asteroid. All rights reserved.
//

import UIKit

//设置UIView 图层属性，可通过IB设置
@objc public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
   
}

@objc public extension UIView {
    
    /// View大小
    var size: CGSize {
        
        get { return CGSize(width: width, height: height) }
        
        set (newValue) {
            
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
            
        }
        
    }
    
    
    /// View中心X坐标
    var centerX: CGFloat {
        
        get { return self.center.x }
        
        set (newValue) {
            
            var center = self.center
            center.x = newValue
            self.center = center
            
        }
        
    }
    
    
    /// View中心Y坐标
    var centerY: CGFloat {
        
        get { return self.center.y }
        
        set (newValue) {
            
            var center = self.center
            center.y = newValue
            self.center = center
            
        }
        
    }
    
    /// EZSwiftExtensions
    var left: CGFloat {
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    }
    
    /// EZSwiftExtensions
    var right: CGFloat {
        get {
            return self.x + self.width
        } set(value) {
            self.x = value - self.width
        }
    }
    
    /// EZSwiftExtensions
    var top: CGFloat {
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    }
    
    /// EZSwiftExtensions
    var bottom: CGFloat {
        get {
            return self.y + self.height
        } set(value) {
            self.y = value - self.height
        }
    }
    
    /// 添加毛玻璃
    ///
    /// - Parameter stype: 毛玻璃样式
    func addBlurEffect(_ stype:UIBlurEffect.Style) {
        
        let blurEffect = UIBlurEffect(style: stype)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.bounds
        self.addSubview(visualEffectView)
        
    }
    
}
// MARK: Layer Extensions
@objc extension UIView {
    /// EZSwiftExtensions
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    //TODO: add this to readme
    /// EZSwiftExtensions
//    public func addShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
//        self.layer.shadowOffset = offset
//        self.layer.shadowRadius = radius
//        self.layer.shadowOpacity = opacity
//        self.layer.shadowColor = color.cgColor
//        if let r = cornerRadius {
//            self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
//        }
//    }
    
    /// EZSwiftExtensions
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    /// EZSwiftExtensions
    public func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    
    //TODO: add to readme
    /// EZSwiftExtensions
    public func addBorderTopWithPadding(size: CGFloat, color: UIColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, height: size, color: color)
    }
    
    /// EZSwiftExtensions
    public func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    
    /// EZSwiftExtensions
    public func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// EZSwiftExtensions
    public func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// EZSwiftExtensions
    fileprivate func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
    //TODO: add this to readme
    /// EZSwiftExtensions
    public func drawCircle(fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.width, height: self.width), cornerRadius: self.width/2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = strokeWidth
        self.layer.addSublayer(shapeLayer)
    }
    //TODO: add this to readme
    /// EZSwiftExtensions
    public func drawStroke(width: CGFloat, color: UIColor) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.width, height: self.width), cornerRadius: self.width/2)
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        self.layer.addSublayer(shapeLayer)
    }
    
    public func addBorderAndCornerRadius(width: CGFloat, color: UIColor, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    public func gradLayer(startColor: UIColor, endColor: UIColor, dirention: UIDeviceOrientation){
        self.gradLayer(startColor: startColor, endColor: endColor, dirention: dirention, at: 0)
    }
    public func gradLayerForNavigationbar(startColor: UIColor, endColor: UIColor, dirention: UIDeviceOrientation){
        self.gradLayer(startColor: startColor, endColor: endColor, dirention: dirention, at: 2)
    }
    
    public func hiddenGraindLayer(){
        self.layer.sublayers?.forEach({ (layer) in
            if let _ = layer as? CAGradientLayer{
                layer.removeFromSuperlayer()
            }
        })
    }
    
    public func gradLayer(startColor: UIColor, endColor: UIColor, dirention: UIDeviceOrientation, at index: Int){
        
        superview?.layoutSubviews()
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradLayer.frame = self.bounds
        switch dirention {
        case .portrait:
            gradLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .landscapeLeft:
            gradLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradLayer.endPoint = CGPoint(x: 1, y: 0.5)
        default:
            gradLayer.startPoint = CGPoint(x: 0, y: 0)
            gradLayer.endPoint = CGPoint(x: 1, y: 1)
        }
        self.layer.insertSublayer(gradLayer, at: UInt32(index))
    }
    
    public func colorImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: self.bounds)
        context.saveGState()
        color.setFill()
        rectanglePath.fill()
        
        context.restoreGState()
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func viewController() -> UIViewController?{
        var nextResponder: UIResponder? = self.next
        while nextResponder != nil {
            if nextResponder?.isKind(of: UIViewController.classForCoder()) == true{
                return nextResponder as? UIViewController
            }
            nextResponder = nextResponder?.next
        }
        return nil
    }
    
    public func gradientImage(startColor: UIColor, endColor: UIColor, dirention: UIDeviceOrientation) -> UIImage{
        
        
        UIGraphicsBeginImageContext(self.bounds.size)
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [startColor.cgColor, endColor.cgColor] as CFArray, locations: [0, 1])!
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: self.bounds)
        context.saveGState()
        rectanglePath.addClip()
        switch dirention {
        case .portrait:
            context.drawLinearGradient(gradient, start: CGPoint(x: self.frame.size.width/2, y: 0), end: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height), options: [])
        case .landscapeLeft:
            context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: self.frame.size.height/2), end: CGPoint(x: self.frame.size.width, y: self.frame.size.height/2), options: [])
        default:
            context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: self.frame.size.width, y: self.frame.size.height), options: [])
        }
        
        context.restoreGState()
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

//国际化
@objc extension UIView {
    class func layoutDirection() -> UIUserInterfaceLayoutDirection {
        if #available(iOS 9.0, *) {
            return UIView.userInterfaceLayoutDirection(for: UIApplication.shared.keyWindow!.semanticContentAttribute)
        } else {
            // Fallback on earlier versions
            fatalError("layoutDirection")
        }
    }
}
 
extension UIView {
    /// EZSwiftExtensions [UIRectCorner.TopLeft, UIRectCorner.TopRight]
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /// EZSwiftExtensions - Mask square/rectangle UIView with a circular/capsule cover, with a border of desired color and width around it
    public func roundView(withBorderColor color: UIColor? = nil, withBorderWidth width: CGFloat? = nil) {
        self.setCornerRadius(radius: min(self.frame.size.height, self.frame.size.width) / 2)
        self.layer.borderWidth = width ?? 0
        self.layer.borderColor = color?.cgColor ?? UIColor.clear.cgColor
    }
    
    /// EZSwiftExtensions - Remove all masking around UIView
    public func nakedView() {
        self.layer.mask = nil
        self.layer.borderWidth = 0
    }
}


extension UIView
{
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
}

