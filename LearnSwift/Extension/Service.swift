//
//  Service.swift
//  GHU
//
//  Created by 王铭喆 on 2019/1/15.
//  Copyright © 2019 王铭喆. All rights reserved.
//

import Foundation
import Moya
import SwiftyUserDefaults
import Alamofire
import ObjectMapper

public

let formalHost = "https://test.ubhome.pro/api/"   //   正式环境
var baseHost = formalHost

extension DefaultsKeys {
    //token
    var userToken: DefaultsKey<String?> { .init("authorization") }
  
}


// 网络请求结构体
struct PNetwork {
    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<Service>()
    // 发送网络请求
    static func request(
        target: Service,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                print("absoluteString--:\(String(describing: moyaResponse.request?.url?.absoluteString))")
                do {
                    let objectString = Mapper<BaseDataModel>().map(JSONString: try moyaResponse.mapString())
                    if let model = objectString, let code = model.code, code != 200, let message = model.message {
                         print("statuscode=\(moyaResponse.statusCode),message=\(message)")
                    }
                    try success(moyaResponse.mapString())
                } catch {
                    print("statuscode=\(moyaResponse.statusCode),message=\(moyaResponse.description)")
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                print("statuscode=\(error.errorCode),message=\(error.errorDescription ?? "")")
                failure(error)
            }
        }
    }
}

// 定义请求方法
enum Service {
    //排行列表
    case toptenReviews
    //资讯列表
    case advisory
    
}

extension Service: TargetType {
    //请求服务器的根路径
    var baseURL: URL { return URL(string: baseHost)! }
    //每个API对应的具体路径
    var path: String {
        switch self {
        case .toptenReviews:
            return "mining/toptenReviews"
        case .advisory:
            return "checkin/advisory"
        }
    }
    //各个接口的请求方式，get或post
    var method: Moya.Method {
        switch self {
        case .toptenReviews, .advisory:
            return .post
        }
    }
    //单元测试使用
    var sampleData: Data {
        switch self {
        case .toptenReviews, .advisory:
            return "just for test".utf8Encoded
        }
    }
    //请求是否携带参数
    var task: Task {
        switch self {
        case .toptenReviews, .advisory:// Send no parameters
            return .requestPlain
//        case .appCheckAPP(let appChannelValue,let appVersion):
//            return .requestData(bodyEncrypt(params: ["appChannelValue": appChannelValue,"appVersion": appVersion]))
        }
    }
    //请求头
    var headers: [String : String]? {
        var token:String?
        if Defaults[\.userToken] != nil {
            token = Defaults[\.userToken]
        } else {
            token = "11670_d36518dc2e124f448df68cbdde7128cf"
        }
        return ["Content-type":"application/json","authorization":token!]
    }
}

//utf8编码
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
