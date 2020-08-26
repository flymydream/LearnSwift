//
//  CourseModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/21.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper


class CourseModel: BaseDataModel {
    var bannersModel : BannersModel?
    var student_right_top_title : String?
    var institutions = [InstitutionsModel]()
    var lessons = [InstitutionsModel]()
    required  init?(map: Map) {
        super.init(map: map)
    }
    override func mapping(map: Map) {
       super.mapping(map: map)
       bannersModel <- map["banners"]
       student_right_top_title <- map["student_right_top_title"]
       institutions <- map["institutions"]
       lessons <- map["lessons"]
    }
    
}
class BannersModel: CourseModel {
     var editor_content : String?
     var link : String?
     var title : String?
     var bannerImgsChangeModel = [InstitutionIdChangeModel]()
    
    required  init?(map: Map) {
         super.init(map: map)
     }
     override func mapping(map: Map) {
        super.mapping(map: map)
        editor_content <- map["editor_content"]
        link <- map["link"]
        title <- map["title"]
        bannerImgsChangeModel <- map["banner_imgs_change"]
     }
     
}

class InstitutionsModel: CourseModel {
    var institutiontags : String?
    var honor_introduce : String?
    var title : String?
    var institutionIdChange : InstitutionIdChangeModel?
      required  init?(map: Map) {
           super.init(map: map)
       }
       override func mapping(map: Map) {
          super.mapping(map: map)
          institutiontags <- map["institutiontags"]
          honor_introduce <- map["honor_introduce"]
          title <- map["title"]
          institutionIdChange <- map["institution_id_change"]
       }
    
}

class InstitutionIdChangeModel: CourseModel {
    var image_small : String?
    var image : String?
    var intro : String?
    var image_big : String?
    var type : String?
    required  init?(map: Map) {
              super.init(map: map)
    }
  override func mapping(map: Map) {
     super.mapping(map: map)
     image_small <- map["image_small"]
     image <- map["image"]
     intro <- map["intro"]
     image_big <- map["image_big"]
     type <- map["type"]
  }
    
}
