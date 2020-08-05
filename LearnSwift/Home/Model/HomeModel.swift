//
//  HodeModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    var student_right_top_title : String?
    
    var bannersModel : HomeBannerArrModel?
    var institutions : Array<HomeInstitutionsModel>?
    var lessons : Array<HomeLessonModel>?
    
    //因为有子model数据,需要重写如下方法
    override func mj_keyValuesDidFinishConvertingToObject() {
        if self.institutions != nil {
            let list = HomeInstitutionsModel.mj_objectArray(withKeyValuesArray: self.institutions)
            if list != nil {
                self.institutions = list! as Array as? [HomeInstitutionsModel]
            }
        }
        if self.lessons != nil {
            let list = HomeLessonModel.mj_objectArray(withKeyValuesArray: self.lessons)
            if list != nil {
                self.lessons = list! as Array as? [HomeLessonModel]
            }
            
        }
        
    }
}
//MARK:banner模型（字典数组嵌套解析，以及更换字段名）
class HomeBannerArrModel: NSObject {
    var banner_imgs_change:Array<AllIMageModel>?
    var banner_imgs : String?
    var title : String?
    //因为有子model数据,需要重写如下方法
    override func mj_keyValuesDidFinishConvertingToObject() {
        if self.banner_imgs_change != nil {
            let list = AllIMageModel.mj_objectArray(withKeyValuesArray: self.banner_imgs_change)
            if list != nil {
                self.banner_imgs_change = list! as NSArray as? [AllIMageModel]
            }
            
        }
        
    }
}

//MARK:institutions模型
class HomeInstitutionsModel: NSObject {
    var title : String?
    var institutiontags : String?
    var id : String?
    var banner_img_change : AllIMageModel?
}

//MARK:lessons模型
class HomeLessonModel: NSObject {
    var title : String?
    var lessontags : String?
    var id : String?
    var single_price : String?
    var total_price : String?
    var banner_img_change : AllIMageModel?

}
