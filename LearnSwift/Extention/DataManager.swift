//
//  DataManager.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//
import Foundation
import UIKit
import SVProgressHUD
import WebKit

//MARK:i计算文字宽高
func getTexWidth(textStr:String,width:CGFloat,font:UIFont,height:CGFloat) -> CGSize {
    let normalText: NSString = textStr as NSString
    let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
    let attributes = [NSAttributedString.Key.font: font]
    let rect:CGRect = normalText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
    return rect.size
}

//MARK:增加阴影
func addShadowToLayer(view:UIView,size:CGSize,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,shadowOpacity:CGFloat,cornerRadiu:CGFloat,shadowRadius:CGFloat) {
    view.layer.cornerRadius = cornerRadiu
    view.layer.shadowColor = kRGBA(R: r, G: g, B: b, A: a).cgColor
    view.layer.shadowOffset = size;
    view.layer.shadowOpacity = Float(shadowOpacity);
    view.layer.shadowRadius = shadowRadius;
}
//MARK:手机号验证
func phoneValidation(phone:String) ->Bool {
    if phone.count < 11 {
        showError(error: "请填写有效手机号码")
        return false;
    }
    let str = String(phone.prefix(2))
    
    if (NSInteger(str)! > 12 && NSInteger(str)! < 20  && phone.count == 11) {
        return true;
    }else{
        showError(error: "请填写有效手机号码")
        return false;
    }
}

//MARK:弹框相关
func showError(error:NSString) {
    
    SVProgressHUD.showError(withStatus: error as String)
    DispatchQueue.main.asyncAfter(deadline:DispatchTime.now()+Double(Int64(1*NSEC_PER_SEC))/Double(NSEC_PER_SEC),execute:{
        dismiss()
    })
}
func showSuccess(success:NSString) {
    
    SVProgressHUD.showSuccess(withStatus: success as String)
    DispatchQueue.main.asyncAfter(deadline:DispatchTime.now()+Double(Int64(1*NSEC_PER_SEC))/Double(NSEC_PER_SEC),execute:{
        dismiss()
    })
}

func dismiss(){
    SVProgressHUD.dismiss()
}

//MARK: web
//FIXME: 请求
func webConfiguration() -> WKWebViewConfiguration?{
    let js = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}"
    let wkUScript = WKUserScript.init(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
    let wkUController = WKUserContentController.init()
    wkUController.addUserScript(wkUScript)
    let wkWebConfig =  WKWebViewConfiguration.init()
    wkWebConfig.userContentController = wkUController
    return wkWebConfig
}


