//
//  AllIMageModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class AllIMageModel: NSObject {
    var type : String = ""
    var intro : String = ""
    var URL : String = ""
    var image : String = ""

    func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return ["URL" : "url"]
    }


}
