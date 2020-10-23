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
    func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
               if (!JSONSerialization.isValidJSONObject(jsonDic)) {
                   print("is not a valid json object")
                   return nil
           }
           //利用自带的json库转换成Data
           //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
           let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
           //Data转换成String打印输出
           let str = String(data:data!, encoding: String.Encoding.utf8)
           //输出json字符串
           print("Json Str:\(str!)")
           return data
        
    }
    
}

