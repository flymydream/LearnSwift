//
//  TSNetworkRequest.swift
//  TSPractice-Switf
//
//  Created by Feng on 2018/9/14.
//  Copyright © 2018年 Feng. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


private let NetWorkRequestShareInstance = TSNetworkRequest()

class TSNetworkRequest: NSObject {
    class var sharedInstance:TSNetworkRequest {
        return NetWorkRequestShareInstance
    }
}

extension TSNetworkRequest{
    func GetRequest(UrlString:String,params:[String:Any]?,success:@escaping(_ response:[String:AnyObject])->(),failure:@escaping(_ error:Error)->()) {
        let PathUrl = BASE_URL+UrlString
        let headers: HTTPHeaders = [
            "token" : getAccessToken(),
            "eityin-app" : "appios",
            "eityin-lang" : "zh",
            "api-version" : "v1001",
            "telephone" : getPhone(),
            "uuid" : getDevUuid()
        ]
        print("请求参数:url=\(PathUrl)\n header=\(headers)\nparameters=\(String(describing: params))\n")
        Alamofire.request(PathUrl, method: .get, parameters: params,headers: headers).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                if let value = response.result.value as? [String:AnyObject]{
                    let json = JSON(value)
                    let code:Int = json["code"] .int!
                    if code == 200 {
                        success(value)
                    }else if code == 1000000 {
                        showError(error: "登陆被挤")
                    }else{
                        let str:String = json["message"] .string!
                        showError(error: str as NSString)
                    }
                }
                let jsonData = JSON(value)
                print("返回数据:\(jsonData)")
            case .failure(let error):
                failure(error)
                print("请求错误\(String(describing: response.result.error))")
            }
            
        }
    }
    
    
    //paramer mark===post请求 =
    func PostRequest(UrlString:String,paramer:[String:Any],success:@escaping(_ response:[String:AnyObject])->(),failure:@escaping(_ error:Error)->()){
        let PathUrl = BASE_URL+UrlString
        let headers: HTTPHeaders = [
            "token" : getAccessToken(),
            "eityin-app" : "appios",
            "eityin-lang" : "zh",
            "api-version" : "v1001",
            "telephone" : getPhone(),
            "uuid" : getDevUuid()
        ]
        print("请求参数:url=\(PathUrl)\n header=\(headers)\nparameters=\(String(describing: paramer))\n")
        Alamofire.request(PathUrl, method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String:AnyObject]{
                    let json = JSON(value)
                    print("返回数据=\(json)\n---\(String(describing: response.response?.allHeaderFields))")
                    let code:Int = json["code"] .int!
                    if code == 200 {
                        success(value)
                        
                    }else if code == 1000000 {
                        showError(error: "登陆被挤")
                    }else{
                        let str:String = json["message"] .string!
                        showError(error: str as NSString)
                    }
                }
            case .failure(let error):
                failure(error)
                print("请求错误\(String(describing: response.result.error))")
            }
        }
    }
    
    
    ///上传图片
    
    func upLoadImageRequest(UrlString:String,params:[String:String],data:[Data],name:[String],success:@escaping(_ response:[String:AnyObject])->(),failure:@escaping(_ error:Error)->()){
        let headers = ["content-type":"multipart/form-data"]
        let PathUrl = BASE_URL+UrlString
        Alamofire.upload(multipartFormData: { (multipartforData) in
            let flag = params["flag"]
            let userId = params["userId"]
            multipartforData.append((flag?.data(using: String.Encoding.utf8))!, withName: "flag")
            multipartforData.append((userId?.data(using: String.Encoding.utf8))!, withName: "userId")
            for i in 0..<data.count{
                multipartforData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
            }
            
        }, to: PathUrl,
           headers: headers,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let value = response.result.value as? [String: AnyObject]{
                        success(value)
                        let json = JSON(value)
                        print(json)
                    }
                }
            case .failure(let encodingError):
                print(encodingError)
                
            }
        }
        )
    }
}
