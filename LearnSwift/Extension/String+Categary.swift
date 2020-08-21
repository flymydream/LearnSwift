//
//  String+Categary.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/20.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//
import UIKit

extension String {
   //MARK:时间戳转化为时间
   func timeStampToString(timeStamp:String,DateFormat:String)->String {
       let string = NSString(string: timeStamp)
       let timeSta:TimeInterval = string.doubleValue / 1000
       let dfmatter = DateFormatter()
       dfmatter.locale = Locale.init(identifier: "zh_CN")
       dfmatter.dateFormat = DateFormat
       let date = NSDate(timeIntervalSince1970: timeSta)
       return dfmatter.string(from: date as Date)
   }

   //MARK:时间转化为时间戳
   func stringToTimeStamp(stringTime:String,DateFormat:String)->String {
       let dfmatter = DateFormatter()
       dfmatter.dateFormat = DateFormat
       let date = dfmatter.date(from: stringTime)
       let dateStamp:TimeInterval = date!.timeIntervalSince1970
       let dateSt:Int = Int(dateStamp)
       print(dateSt)
       return String(dateSt)
   }
    
}

