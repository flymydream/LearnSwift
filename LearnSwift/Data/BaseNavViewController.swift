//
//  BaseNavViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/28.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class BaseNavViewController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {
    var isPusing : Bool = false
    
    typealias CustomLeftBackButtonAction = (() -> Void)
    var clickAction : CustomLeftBackButtonAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if isPusing {
            return
        } else {
            self.isPusing = true
        }
        if viewController.navigationItem.leftBarButtonItem == nil , self.viewControllers.count > 0 {
            viewController.navigationItem.setLeftBarButton(createLeftBarButton(clickAction: nil), animated: true)
        }
        
    }


    func createLeftBarButton(clickAction:CustomLeftBackButtonAction?) -> UIBarButtonItem {
        self.clickAction = clickAction
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30.0, height: 18.0)
        button.addTarget(self, action: #selector(clickEvent), for: .touchUpInside)
        button.setImage(UIImage(named: "back_button_black"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        let backButton = UIBarButtonItem(customView: button)
        return backButton
    }
    
    @objc func clickEvent() {
        if let clickAction = clickAction {
            clickAction()
        } else {
            self.popViewController(animated: true)
        }
    }
    
}
