//
//  HodeModel.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeModel: BaseDataModel {
    var miningLevel = ""
    var account = ""
    var powerBTCModel : PowerBTCModel?
    var powerPMEERModel : PowerPMEERModel?
    
    required  init?(map: Map) {
           super.init(map: map)
    }
    override func mapping(map: Map) {
          super.mapping(map: map)
          miningLevel <- map["miningLevel"]
          account <- map["account"]
          powerBTCModel <- map["BTC"]
          powerPMEERModel <- map["PMEER"]
    }
}

class PowerBTCModel: HomeModel {
    var countCalculationPower = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    override func mapping(map: Map) {
         super.mapping(map: map)
         countCalculationPower <- map["countCalculationPower"]
    }
}
class PowerPMEERModel: HomeModel {
    
    var countCalculationPower = ""
    required init?(map: Map) {
         super.init(map: map)
    }
    override func mapping(map: Map) {
        super.mapping(map: map)
        countCalculationPower <- map["countCalculationPower"]
    }

}


