//
//  LoginViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/9/28.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper
class LoginViewController: BaseViewController,VertificationViewDelegate {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var phoneStr : String?
    var emailStr : String?
    var areaCodeStr : String?
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func clickEyeButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func clickBottomButton(_ sender: UIButton) {
        if (sender.tag == 0) {//点击登录
            PNetwork.request(target: .userLogin(loginName:"18592079278", pwd:"phxphx9578",loginType:"1"), success: { (json) in
                let dict = ["areaCode":"86","internalStaff":"0","openEmailVerify":"0","openGoogleVerify":"0","openPhoneVerify":"1","email":"mazhao1515@163.com","phone":"13720410316"]
                self.phoneStr = dict["phone"];
                self.emailStr = dict["email"];
                self.areaCodeStr = dict["areaCode"];
                
                let codeView = VertificationView()
                codeView.delegate = self
                codeView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
                let delegate =  UIApplication.shared.delegate as! AppDelegate
                delegate.window?.addSubview(codeView)

            }) { (errpr) in
                print("登录接口报错:\(errpr)")
            }
        } else if(sender.tag == 1) {//点击注册
            
        } else {//点击忘记密码
            
        }
        
        
    }
    
    func clickConfirmButton() {
        PNetwork.request(target: .confirmLogin(loginName: "18592079278", loginType: "1", pwd: "phxphx9578", phoneCode: "151231"), success: { (json) in
            //                let rootVC =  MainTabbarViewController()
            //                UIApplication.shared.keyWindow?.rootViewController = rootVC
        }) { (error) in
            
        }
    }
    
    func clickGetCodeButton() {
        
    }
    
}
