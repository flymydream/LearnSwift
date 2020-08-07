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
        
        let firstVC = HomeViewController()
        firstVC.title = "首页"
        self.setTabbarItem(tabBarItem: firstVC.tabBarItem, title: "首页", size: 10, selectedImage: "icon_tab bars_home_sel", normalImage: "icon_tab bars_home_nor")
        
        let nav1 = BaseNavViewController.init(rootViewController: firstVC)
        
        
        
        let secondVC = CourseHomeViewController()
        secondVC.title = "课程"
        self.setTabbarItem(tabBarItem: secondVC.tabBarItem, title: "课程", size: 10, selectedImage: "icon_tab bars_course_sel", normalImage: "icon_tab bars_course_nor")
        let nav2 = BaseNavViewController.init(rootViewController: secondVC)
        
      let cartVC = ComminityViewController()
      cartVC.title = "社区"
      self.setTabbarItem(tabBarItem: cartVC.tabBarItem, title: "社区", size: 10, selectedImage: "icon_tab bars_community_sel", normalImage: "icon_tab bars_community_nor")
      let nav3 = BaseNavViewController.init(rootViewController: cartVC)
      
      
      let profileVC = ProfileViewController()
      profileVC.title = "个人中心"
      self.setTabbarItem(tabBarItem: profileVC.tabBarItem, title: "个人中心", size: 10, selectedImage: "icon_tab bars_me_sel", normalImage: "icon_tab bars_me_nor")
     let nav4 = BaseNavViewController.init(rootViewController: profileVC)
        
        self.viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    
    
    func setTabbarItem(tabBarItem:UITabBarItem,title:String,size:CGFloat,selectedImage:String,normalImage:String) {
         // 修改标签栏选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:kRGBA(R: 0, G: 0, B: 0, A: 0.7),NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: size)],for: .selected)
        
        // 修改标签栏未选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:kRGBA(R: 0, G: 0, B: 0, A: 0.7),NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: size)], for: .normal)
        tabBarItem.title = title
        tabBarItem.image = UIImage.init(named: normalImage)
        tabBarItem.selectedImage = UIImage.init(named: selectedImage)
    
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
