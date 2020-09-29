//
//  LoginViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/9/28.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper
class LoginViewController: BaseViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func clickEyeButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func clickBottomButton(_ sender: UIButton) {
        if (sender.tag == 0) {//点击登录
            PNetwork.request(target: .userLogin(account: self.accountTextField.text ?? "saiji666", password: self.passwordTextField.text ?? "aaaa1111"), success: { (json) in
                let baseString = Mapper<BaseDataModel>().map(JSONString: json as! String)
                
                let rootVC =  MainTabbarViewController()
                UIApplication.shared.keyWindow?.rootViewController = rootVC
            }) { (errpr) in
                print("登录接口报错:\(errpr)")
            }
        } else if(sender.tag == 1) {//点击注册
            
        } else {//点击忘记密码
            
        }
        
        
    }
    
    
}
