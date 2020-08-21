//
//  NewsModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/19.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper


class NewsModel: BaseDataModel {
    var title : String?
    var content : String?
    var createTime : Int?
    var updateTime : Int?
    var name : String?
    var Remarks : String?
    var type : String?

    required  init?(map: Map) {
        super.init(map: map)
    }
   override func mapping(map: Map) {
        super.mapping(map: map)
        title <- map["title"]
        content <- map["content"]
        createTime <- map["createTime"]
        updateTime <- map["updateTime"]
        name <- map["name"]
        Remarks <- map["Remarks"]
        type <- map["type"]
   }
    
  
}
