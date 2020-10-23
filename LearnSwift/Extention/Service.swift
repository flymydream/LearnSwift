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
import CryptoSwift

public

let formalHost = "https://www.ubcoin.pro"   //   正式环境
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
    //登录
    case userLogin(loginName:String,pwd:String,loginType:String)//app登录
    //排行列表
    case toptenReviews
    //资讯列表
    case advisory
    
    case confirmLogin(loginName:String,loginType:String,pwd:String,phoneCode:String)
  
    
    
}

extension Service: TargetType {
    //请求服务器的根路径
    var baseURL: URL {
         return URL(string: baseHost)!
    }
    //每个API对应的具体路径
    var path: String {
        switch self {
        case .toptenReviews:
            return "mining/toptenReviews"
        case .advisory:
            return "checkin/advisory"
        case .userLogin(loginName: _, pwd: _,loginType: _):
             return "/user/user/account/loginPre"
        case .confirmLogin(loginName: _,loginType: _,pwd: _,phoneCode: _):
             return "/user/user/account/login"
        }
    }
    //各个接口的请求方式，get或post
    var method: Moya.Method {
        switch self {
        case .toptenReviews, .advisory:
            return .post
        case .userLogin,.confirmLogin:
            return .post
        
        }
    }
    //单元测试使用
    var sampleData: Data {
        switch self {
        case .toptenReviews,.advisory,.userLogin,.confirmLogin:
            return "just for test".utf8Encoded
        }
    }
    //请求是否携带参数
    var task: Task {
        switch self {
        case .toptenReviews, .advisory:// Send no parameters
            return .requestPlain
        case .userLogin(let loginName, let pwd,let loginType):
            return .requestParameters(parameters :["loginName": loginName,"pwd":pwd,"loginType":loginType] , encoding: URLEncoding.default)
        case .confirmLogin(let loginName, let loginType, let pwd, let phoneCode):
            return .requestParameters(parameters: ["loginName":loginName,"loginType":loginType,"pwd":pwd,"phoneCode":phoneCode], encoding: URLEncoding.default)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default // Send parameters as JSON in request body
    }
    
    //请求头
    var headers: [String : String]? {
        var token:String?
        if Defaults[\.userToken] != nil {
            token = Defaults[\.userToken]
        } else {
//            token = "11670_d36518dc2e124f448df68cbdde7128cf"
              token = ""
        }
//         [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",tokenStr] forHTTPHeaderField:@"Authorization"];
        let string : String =  "Bearer \(token)"
        return ["Content-type":"application/json","Authorization":string,"clientType":"1"]
    }
  
}

//请求体加密输出
func bodyEncypt(params:NSMutableDictionary) -> Dictionary<String,Any> {
    print("params--:\(params)")
    do {
       // 出初始化AES
        let aes = try AES(key: secrectKey, blockMode: ECB(iv: byteIv), padding: .pkcs7)
       // 进行AES加密
       encryptBytes = try aes.encrypt(byteText)
    } catch {
       // 异常处理
    }
    let aesString:String = CCPAESTool.inputDictionary(params, andSecretKey: secrectKey)
    let dateNow : Date = Date()
    let timeSp = String(dateNow.timeIntervalSince1970)
    let strArr = timeSp.components(separatedBy: ".")
    let timeFirst = strArr.first
    let paramDict : Dictionary<String,Any> = ["d":aesString,"t":timeFirst]
    return paramDict
}

//utf8编码
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
