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
    var lessons = [LessonsModel]()
}
class BannersModel: CourseModel {
     var editor_content : String?
     var link : String?
     var title : String?
     var sort : String?
     var banner_imgs : String?
     var banner_img : String?
     var tag : String?
     var id : String?
     var userback_id : String?
     var delete_time : String?
     var is_used : String?
     var create_time : String?
     var update_time : String?
     var editor_content_bjqimg : String?
    var bannerImgsChangeModel : BannerImgChangeModel?
     
}

class InstitutionsModel: CourseModel {

    var logo_img : String?
    var is_hot : String?
    var banner_imgs : String?
    var insitution_introduce : String?
    var title : String?
    var major_id : String?
    var corporation_img : String?
    var userinstitution_id : String?
    var lat : String?
    var verifylog_id : String?
    var corporatcion_content : String?
    var sort : String?
    var userback_id : String?
    var id : String?
    var corporatcion_content_bjqimg : String?
    var edustage_id : String?
    var institutiontags : String?
    var insproperties_id : String?
    var institutiontype_id : String?
    var admission_policy : String?
    var tel : String?
    var diqu_id : Int?
    var honor_introduce_bjqimg : String?
    var is_used : String?
    var is_submit : String?
    var is_back_write : String?
    var is_verify : String?
    var schoolmotto_img : String?
    var address : String?
    var lesson_ids : String?
    var is_recomment : String?
    var longs : String?
    var is_collect : String?
    var idcard_imgs : String?
    var address_supply : String?
    var create_time : String?
    var insitution_introduce_bjqimg : String?
    var banner_img_change : BannerImgChangeModel?
}
class BannerImgChangeModel: CourseModel {
    var image_small : String?
    var image : String?
    var intro : String?
    var url : String?
    var id : String?
    var is_used : String?
    var type : String?
    var banner_img : String?
}

class LessonsModel: CourseModel {
    var banner_imgs : String?
    var start_time : String?
    var is_limit : String?
    var major_id : String?
    var title : String?
    var userinstitution_id : String?
    var lesson_content_bjqimg : String?
    var givelessontype_id : String?
    
     var total_price : String?
     var teaching_content : String?
     var sort : String?
     var userback_id : String?
     var totalclass : String?
     var delete_time : String?
     var update_time : String?
     var id : String?
    
    var introduce : String?
    var teacher_ids : String?
    var detailtime : String?
    var single_price : String?
    var lessontags : String?
    var lessonperiod : String?
    var lesson_ids : String?
    var stock : String?
    
    var is_used : String?
    var teaching_content_bjqimg : String?
    var end_time : String?
    var lesson_content : String?
    var is_recomment : String?
    var allowbuytype_ids : String?
    
    var institutionIdChange : InstitutionIdChangeModel?
    
}

class InstitutionIdChangeModel: CourseModel {
    
    var mainmajor_ids : String?
    var major_id : String?
    var corporation_img : String?
    var verifylog_id : String?
    var diqu_id : String?
    var lesson_ids : String?
    var is_used : String?
    var lat : String?
    
    var banner_img : String?
    var schoolmotto_img : String?
    var banner_imgs : String?
    var institutiontype_id : String?
    var address : String?

    
    var title : String?
    var delete_time : String?
    var idcard_imgs : String?
    var userinstitution_id : String?
    var insitution_introduce_bjqimg : String?
    var create_time : String?
    var is_verify : String?
    var longs : String?
    var insproperties_id : String?
    var honor_introduce : String?
    var corporatcion_content_bjqimg : String?
    var edustage_id : String?
    
    var honor_introduce_bjqimg : String?
    var is_recomment : String?
    var is_back_write : String?
    var userback_id : String?
    var sort : String?
    var logo_img : String?
    var update_time : String?
    var institutiontags : String?
    
    var is_submit : String?
    var tel : String?
    var insitution_introduce : String?
    var id : String?
    var is_collect : String?
    var admission_policy : String?
    var address_supply : String?
    var corporatcion_content : String?
    
}
