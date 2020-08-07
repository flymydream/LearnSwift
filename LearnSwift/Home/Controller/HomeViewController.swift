//
//  HomeViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,HomeHeaderViewDelegate,HomeCourseTableViewCellDelegate {
 
    var homeModel : HomeModel?
    var headerView :HomeHeaderView?
    var tableView = UITableView()
    
    let organizationCell = "HomeCourseTableViewCell-inst"
    let courseCell = "HomeCourseTableViewCell-course"
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    func getRequestData() {
         let url:String = "api/index/index"
        TSNetworkRequest.sharedInstance.GetRequest(UrlString: url, params: nil, success: { (value) in
            let jsonObj = JSON(value)
            let dic = jsonObj["data"].rawValue
            self.homeModel = homeModel?.mj_setKeyValues(dic)
            self.headerView?.model = self.homeModel
             print("\n----------\(jsonObj["data"]["student_right_top_title"])\n---\(String(describing: self.homeModel?.institutions![0].title))")
            self.tableView.reloadData()
            
        }) { (error) in
        
        }
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          self.navigationController?.navigationBar.isHidden = true
      }
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          self.navigationController?.navigationBar.isHidden = false
      }
    func initialiseUI() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT-kBottomH-kStatusNavH),style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedSectionFooterHeight = 0
        self.view.addSubview(tableView)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        //headerview
        self.headerView = HomeHeaderView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 936*HEI))
        self.headerView?.delegate = self
        self.tableView.tableHeaderView = self.headerView
        
        tableView.register(HomeCourseTableViewCell.classForCoder(), forCellReuseIdentifier: organizationCell)
        tableView.register(HomeCourseTableViewCell.classForCoder(), forCellReuseIdentifier: courseCell)
        
        
        
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 2
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if indexPath.row == 0 {
            let aCell : HomeCourseTableViewCell = tableView.dequeueReusableCell(withIdentifier: organizationCell) as! HomeCourseTableViewCell
            aCell.titleLab.text = "推荐机构"
            aCell.type = 1
            if self.homeModel != nil {
                aCell.setPassData(model: self.homeModel!)
            } else {
                
            }
            aCell.delegate = self
            aCell.selectionStyle = .none
            return aCell
        } else {
           let aCell : HomeCourseTableViewCell = tableView.dequeueReusableCell(withIdentifier: organizationCell) as! HomeCourseTableViewCell
            aCell.titleLab.text = "推荐视频哈哈"
            aCell.type = 1
            if self.homeModel != nil {
                aCell.setPassData(model: self.homeModel!)
            } else {
                
            }
            aCell.delegate = self
            aCell.selectionStyle = .none
            return aCell
            
        }
     }
     
     func homeHeaderFunctionClick(view: HomeHeaderView, index: NSInteger) {
         switch index {
           case 1:
              print("----\n学府正盛")
           case 2:
               print("----\n机构导览")
           case 3:
               print("----\n3在线课程")
           case 4:
              print("----\n4艺术资讯")
           default:
                print("")
           }
     }
     
     func homeBannerClick(view: HomeHeaderView, index: NSInteger) {
        let bannerM:AllIMageModel = (self.homeModel?.bannersModel?.banner_imgs_change![index]) as! AllIMageModel
        if bannerM.URL.count>0 {
            let vc = HomeWebViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
     }
     
     func homeCePingClick() {
        let vc = HomeWebViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
     }
     
     func didSelectItemAt(institutionId: String) {
        
    
        
     }

}
