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
        createViews()
    }
    
    func createViews() {
        let firstVC = HomeViewController()
        firstVC.title = "首页"
        self.setTabbarItem(title: "首页", size: 10, selectedImage: "icon_tab bars_home_sel", normalImage: "icon_tab bars_home_nor",clildVC: firstVC)

        let secondVC = NewsViewController()
        secondVC.title = "资讯"
        self.setTabbarItem(title: "资讯", size: 10, selectedImage: "icon_tab bars_course_sel", normalImage: "icon_tab bars_course_nor",clildVC: secondVC)

        let cartVC = MarketViewController()
        cartVC.title = "行情"
        self.setTabbarItem(title: "行情", size: 10, selectedImage: "icon_tab bars_community_sel", normalImage: "icon_tab bars_community_nor",clildVC: cartVC)

        let profileVC = MineViewController()
        profileVC.title = "个人中心"
        self.setTabbarItem(title: "个人中心", size: 10, selectedImage: "icon_tab bars_me_sel", normalImage: "icon_tab bars_course_nor", clildVC: profileVC)
    }
    
    func setTabbarItem(title:String,size:CGFloat,selectedImage:String,normalImage:String,clildVC:UIViewController) {
        clildVC.tabBarItem.title = title;
        
        // 修改标签栏选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:kRGBA(R: 0, G: 0, B: 0, A: 0.7),NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: size)],for: .selected)

        // 修改标签栏未选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:kRGBA(R: 0, G: 0, B: 0, A: 0.7),NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: size)], for: .normal)
        
        clildVC.tabBarItem.title = title
        clildVC.tabBarItem.image = UIImage.init(named: normalImage)
        clildVC.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        let nav = BaseNavViewController.init(rootViewController: clildVC)
        self.addChild(nav)
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
