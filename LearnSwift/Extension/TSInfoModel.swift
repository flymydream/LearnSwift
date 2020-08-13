//
//  TSInfoModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class TSInfoModel: NSObject,NSCoding {
    
     @objc var balance : String?
     @objc var token : String?
     @objc var avatar_img : String?
     @objc var id : String?
     @objc var nickname : String?
     @objc var collectnum : String?
     @objc var telephone : String?
     @objc var ordernum : String?
     @objc var lessonnum : String?
     @objc var is_read : String?
     @objc var couoponnum : String?
     
     // MARK:- 处理需要归档的字段
     func encode(with aCoder:NSCoder) {

         aCoder.encode(balance, forKey:"balance")
         aCoder.encode(nickname, forKey:"nickname")
         aCoder.encode(token, forKey:"token")
         aCoder.encode(avatar_img, forKey:"avatar_img")
         aCoder.encode(id, forKey:"id")
         aCoder.encode(collectnum, forKey:"collectnum")
         aCoder.encode(telephone, forKey:"telephone")
         aCoder.encode(ordernum, forKey:"ordernum")
         aCoder.encode(lessonnum, forKey:"lessonnum")
         aCoder.encode(couoponnum, forKey:"couoponnum")
         aCoder.encode(is_read, forKey:"is_read")
     }
     
     // MARK:- 处理需要解档的字段
     required init(coder aDecoder:NSCoder) {
         super.init()
         balance = aDecoder.decodeObject(forKey:"balance")as?String
         nickname = aDecoder.decodeObject(forKey:"nickname")as?String
         token = aDecoder.decodeObject(forKey:"token")as?String
         avatar_img = aDecoder.decodeObject(forKey:"avatar_img")as?String
         id = aDecoder.decodeObject(forKey:"id")as?String
         collectnum = aDecoder.decodeObject(forKey:"collectnum")as?String
         telephone = aDecoder.decodeObject(forKey:"telephone")as?String
         ordernum = aDecoder.decodeObject(forKey:"ordernum")as? String
         lessonnum = aDecoder.decodeObject(forKey:"lessonnum")as? String
         couoponnum = aDecoder.decodeObject(forKey:"couoponnum")as? String
         is_read = aDecoder.decodeObject(forKey:"is_read")as? String
     }
     override init() {
     
     super.init()
     
     }
}
