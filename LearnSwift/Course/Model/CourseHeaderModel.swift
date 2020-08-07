//
//  CourseHeaderModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/6.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
public
class CourseHeaderModel: NSObject {
    
    var bannersModel : CourseHeaderModel?
    var lessons_hot :Array<CourseHeaderLessonsHotModel>?
    
    //重写
    func mj_didConvertToObjectWithKeyValues() {
        if self.lessons_hot != nil {
            let list = CourseHeaderLessonsHotModel.mj_objectArray(withKeyValuesArray: self.lessons_hot)
            if  list != nil {
                self.lessons_hot = list! as NSArray as! [CourseHeaderLessonsHotModel]
            }
        }
    }
}

class CourseHeaderBannerModel: NSObject {
    var banner_imgs_change:Array<AllIMageModel>?
    var lessons_hot : String?
    func mj_didConvertToObjectWithKeyValues() {
        if self.banner_imgs_change != nil {
            let list = AllIMageModel.mj_objectArray(withKeyValuesArray: self.banner_imgs_change)
            if list != nil {
                self.banner_imgs_change = list! as Array as? [AllIMageModel]
            }
        }
    }
}


class CourseHeaderLessonsHotModel: NSObject {
    var title : String?
    var lessonsTags : String?
    var single_price : String?
    var id : String?
    var total_price : String?
    var banner_img_change : AllIMageModel?
}

class CourseHomeListModel: NSObject {
    var title : String?
    var id : String?
    var total_price : String?
    var lessonstags : String?
    var banner_img_changeModel : AllIMageModel?
    var institution_id_changeModel : CourseHomeListInstitutionModel?//机构
    
}

class CourseHomeListInstitutionModel : NSObject {
    var title : String?
    var institutiontype_id : String?
    var insitution_introduce_bjqimg : String?

}
