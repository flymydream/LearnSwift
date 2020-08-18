//
//  BaseDataModel.swift
//  TianYe
//
//  Created by 王铭喆Mac on 2020/3/20.
//  Copyright © 2020 王铭喆Mac. All rights reserved.
//

import UIKit
import ObjectMapper
class BaseDataModel: Mappable {
    var code: Int?
    var message: String?
    var data: AnyObject?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}

class LoginModel: Mappable {
    var access_token: String = ""
    var token_type: String = ""
    var refresh_token: String = ""
    var expires_in: Int = 0
    var scope: String = ""
    var license: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        access_token <- map["access_token"]
        token_type <- map["token_type"]
        refresh_token <- map["refresh_token"]
        expires_in <- map["expires_in"]
        scope <- map["scope"]
        license <- map["license"]
    }
}

