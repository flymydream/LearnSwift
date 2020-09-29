//
//  AppDelegate.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/27.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = LoginViewController()
        return true
    }
    
  



}

