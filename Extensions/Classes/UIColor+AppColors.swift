//
//  UIColor+AppColors.swift
//  PassVPN
//
//  Created by Asteroid on 2017/12/26.
//  Copyright © 2017年 Asteroid. All rights reserved.
//
import UIKit

public extension UIColor {
    class var menuBackgroundColor: UIColor {
        return UIColor.rgb(53, 78, 134)
    }
    
    //主题色
    class var main: UIColor {
        return UIColor.rgb(104, 56, 250)
    }
    
    class var mainDeepGrayColor: UIColor {
        return UIColor.rgb(82, 80, 108)
    }
    
    //导航栏颜色
    class var navigationBarColor: UIColor {
        return UIColor.main
    }
    
    //分割线颜色
    class var lineColor: UIColor {
        //242 242 245
        return UIColor.colorWithHex("#f2f2f5")
    }
    
    //深色分割线
    class var deepLineColor: UIColor {
        //117 117 182
        return UIColor.colorWithHex("#b1b1b6")
    }
    
    //主题灰
    class var mainGrayColor: UIColor{
        return UIColor.rgb(168, 168, 168)
    }
    
    //购买页蓝
    class var vipBlueColor: UIColor{
        return UIColor.rgb(138, 188, 255)
    }
    //蒙层颜色
    class var maskBackgroundColor: UIColor {
        return .init(white: 0, alpha: 0.6)
    }
    
    //比主标题更深的标题颜色
    class var deepTitleColor: UIColor {
        //39 38 52
        return UIColor.colorWithHex("#272634")
    }
    
    //主标题颜色
    class var titleColor: UIColor {
        return UIColor.main
    }
    
    //副标题颜色
    class var subTitleColor: UIColor {
        return UIColor.rgb(177, 177, 182)
    }
    
    //副标题颜色
    class var separatorLineColor: UIColor {
        return UIColor.rgb(200, 199, 204)
    }
    
    //比副标题更浅的标题颜色
    class var lightTitleColor: UIColor {
        //153 153 153
        return UIColor.colorWithHex("#999999")
    }
    
    //背景色
    class var backgroundColor: UIColor {
        //242 242 245
        return UIColor.rgb(247, 247, 247)
    }
    
    //数据为空时，提示标题颜色
    class var emptyTitleColor: UIColor {
        //242 242 242
        return UIColor.colorWithHex("#f2f2f2")
    }
    
    //tableview cell选中的时候的颜色
    class var tableViewCellSelectedColor: UIColor {
        //245 245 245
        return UIColor.colorWithHex("#f5f5f5")
    }
    
    //tableview cell normal 状态下背景色
    class var tableViewCellNormalColor: UIColor {
        return UIColor.white
    }
    
    //红色
    class var fitnessRed: UIColor {
        return UIColor.rgb(248, 97, 97)
    }
    
    //绿色
    class var fitnessGreen: UIColor {
        return UIColor.rgb(79, 196, 135)
    }
    
    //蓝色
    class var fitnessBlue: UIColor {
        return UIColor.rgb(27, 136, 255)
    }
    
    //黄色
    class var fitnessYellow: UIColor {
        return UIColor.rgb(255, 199, 64)
    }
    
    //紫色
    class var fitnessPurple: UIColor {
        return UIColor.rgb(152, 101, 242)
    }
    
    //运动过程中绿色进度条颜色
    class var sportProgressGreenColor: UIColor {
        return UIColor.circleGreenColor
    }
    
    //运动过程中灰色进度条颜色
    class var sportProgressGrayColor: UIColor {
        return UIColor.rgb(177, 177, 182)
    }
    
    //性别选择男
    class var maleColor: UIColor {
        return UIColor.rgb(46, 111, 253)
    }
    
    //性别选择女
    class var femaleColor: UIColor {
        return UIColor.rgb(253, 1, 132)
    }
    
    class var shareButtonColor: UIColor{
        return UIColor.rgb(25, 167, 120)
    }
    
    class var circleGreenColor: UIColor {
        return UIColor.rgb(24, 167, 120)
    }
    
    class func rgb(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    class func rgb(_ r: Int, _ g: Int, _ b: Int, _ a: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    
    class var homeBackgroundColor: UIColor {
        return UIColor.white
    }
    
}

public extension UIColor {
    class func colorWithHex(_ hex: String) -> UIColor {
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
    
        if cString.hasPrefix("#") {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = String(cString[index...])
            
        }
        
        if cString.count != 6 {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString[...rIndex]
        let otherString = cString[...rIndex]
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString[...gIndex]
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString[...bIndex]
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    /// 通过16机制数值来获取颜色
    /// - Parameter value: 16进制数
    /// - Returns:
    class func colorWithHex(_ value: UInt) -> UIColor {
           return UIColor(
               red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(value & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
}
