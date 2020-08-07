//
//  BannerModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/6.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class BannerModel: NSObject {
    var product_id : String?
    var id : String?
    var image : String?
    var type : String?
    var p_type : String?
    var product_image : String?
    var url : String?
    
    init(jsonData : JSON){
        product_id = jsonData["product_id"].stringValue
        id = jsonData["id"].stringValue
        image = jsonData["image"].stringValue
        type = jsonData["type"].stringValue
        p_type = jsonData["p_type"].stringValue
        product_image = jsonData["product_image"].stringValue
        url = jsonData["url"].stringValue
    }

    
}
