  //
//  MainTabbarViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/27.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
   
    deinit {
        print("我被销毁了")
        
    }

}
