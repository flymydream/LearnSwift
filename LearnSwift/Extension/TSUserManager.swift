//
//  TSUserManager.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import Foundation
import UIKit

//数据个人存储
func savaUserInfo(userModel:TSInfoModel) {
    NSKeyedArchiver.archiveRootObject(userModel, toFile: getSavePath())
}
//数据获取
func getUserInfo() -> TSInfoModel {
    let model = TSInfoModel()
    if (NSKeyedUnarchiver.unarchiveObject(withFile:getSavePath()) != nil) {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: getSavePath())as?TSInfoModel)!
    }else{
        return model;
    }
}
//清除数据
func deleteUserInfo() {
    try? FileManager.default.removeItem(atPath: getSavePath())
}
//刷新数据
func updateUserInfo(userProfile:TSInfoModel) {
    let user:TSInfoModel = getUserInfo()
    user.nickname = userProfile.nickname
    user.telephone = userProfile.telephone;
    user.avatar_img = userProfile.avatar_img;
    user.balance = userProfile.balance;
    user.collectnum = userProfile.collectnum;
    user.ordernum = userProfile.ordernum;
    user.lessonnum = userProfile.lessonnum;
    user.id = userProfile.id;
    user.is_read = userProfile.is_read;
    savaUserInfo(userModel: user)
}
//** 获取沙盒 Document 路径*/
private func getSavePath()->String {
    let cacheDir:String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    let localPath:String = cacheDir.appending("TempTest.txt")
    return localPath;
}
func hasLogined() ->Bool {
    return (getUserInfo().token != nil)
}
//MARK: 获取个人相关信息
func getAccessToken() -> String {
    return (getUserInfo().token != nil) ? getUserInfo().token! :" "
}
func getPhone() -> String {
    return (getUserInfo().telephone != nil) ? getUserInfo().telephone! :" "
}
func getDevUuid() -> String {
    return UIDevice.current.identifierForVendor!.uuidString
}

func TSVersion() -> String {
    let infoDictionary = Bundle.main.infoDictionary
    let appVersion = infoDictionary!["CFBundleShortVersionString"]
    return appVersion as! String
}

func isLogin() -> Bool {
    let token = getAccessToken()
    if (token.isEmpty) {
            return true
        }else{
            return false
        }
}
//获取版本号
func bundleVersion() -> String {
    let infoDic = Bundle.main.infoDictionary
    // 获取App的版本号
    let appVersion = infoDic?["CFBundleShortVersionString"]
    // 获取App的build版本
    //    let appBuildVersion = infoDic?["CFBundleVersion"]
    return appVersion as! String
}
