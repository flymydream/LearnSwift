//
//  Common.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//
import Foundation
import UIKit


//屏幕宽高
let kSCREEN_WIDTH = UIScreen.main.bounds.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.height

//屏幕比例
let HEI:CGFloat = kSCREEN_WIDTH / 750
let kIs_iPhoneX = UIApplication.shared.statusBarFrame.height == 44
let kStatusBarH:CGFloat = UIApplication.shared.statusBarFrame.height
/// 导航栏高度
let kNavBarH: CGFloat = 44.0
let kStatusNavH:CGFloat = kStatusBarH+kNavBarH
let kTabBarH:CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)
let kBottomH:CGFloat = kIs_iPhoneX ? 34 : 0



let KToken = "userToken"
let KDefaults = UserDefaults.standard

//MARK:DIN字体 + 苹方字体
let DINRegular = "DIN-Regular"
let DINMedium = "DIN-Medium"
let DINBold = "DIN-Bold"
let DINBlack = "DIN-Black"
let DINEuro = "DIN-Euro"
let DINLight = "DIN-Light"

let PF_Regular = "PingFangSC-Regular"
let PF_Semibold = "PingFangSC-Semibold"
let PF_Medium = "PingFangSC-Medium"
let PF_Light = "PingFangSC-Light"

let kPlaceHolder16_9 = UIImage(named: "plhold16:9")
let kPlaceHolder1_1 = UIImage(named: "plhold1:1")

//获取appdelegate
let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

//第三方登录
//let WXAPPID  =   "wxbc940b2f7b7b2917"
//let WXAPPKEY =   "53a45612be04480760ccd018624bb2de"
//let QQAPPID  =   "1106794477"
//let QQAPPKEY =   "qoRCTV0y2hUXfjKT"
//let AMPMAPKEY =  "69e62e42684bf503ae551533f11d6662"


let kMainBGColcr = kVALUE_RGB(rgbValue: 0x71DBE0)
let kMainLinkColor = kRGB(R: 206, G: 206, B: 206)
let MainTextColor = kRGB(R: 109, G: 115, B: 119)
let MainSubTextColor = kRGB(R: 136, G: 145, B: 151)
//颜色(rgb,16进制value)
func kRGBA(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) -> UIColor{
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}
func kRGB(R:CGFloat,G:CGFloat,B:CGFloat) -> UIColor {
    return kRGBA(R: R, G: G, B: B, A: 1.0)
}
func kVALUE_RGBA(rgbValue:uint,a:CGFloat) -> UIColor {
    return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat ((rgbValue & 0xFF00) >> 8) / 255.0, blue: CGFloat ((rgbValue & 0xFF))/255.0, alpha: a)
}
func kVALUE_RGB(rgbValue:uint) -> UIColor {
    return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat ((rgbValue & 0xFF00) >> 8) / 255.0, blue: CGFloat ((rgbValue & 0xFF))/255.0, alpha: 1.0)
}



func NotEmpty(object:String) -> String {
    return (object.count > 0) ? object : ""
}

