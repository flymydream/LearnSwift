//
//  CommunityViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/20.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class CommunityViewController: BaseViewController,SDCycleScrollViewDelegate {

    
    @IBOutlet var headView: UIView!
    @IBOutlet weak var bannerView: UIView!
    var sdScrollView = SDCycleScrollView()
    var bannerArray = [BannerImgChangeModel]()
    
    
    @IBOutlet weak var testBankView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initSDView()
        
    }

    func getListData() {
        
        let path = Bundle.main.path(forResource: "city", ofType: "json")
        if let pathStr = path {
            let data = Data.init(contentsOf: URL.init(fileURLWithPath: pathStr)) {
                print("pathStr有问题")
            }
            let array = JSONSerialization.jsonObject(with: data, options: .allowFragments)
        }
       
    }
    
    
    func initSDView() {
        //底部view
        self.headView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 450)
        
        self.bannerView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 200)
        self.headView.addSubview(self.bannerView)
        
        sdScrollView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 200))
        sdScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        sdScrollView.currentPageDotImage = UIImage(named: "sliding indicator_sel")
        sdScrollView.pageDotImage = UIImage(named: "sliding indicator_nor")
        sdScrollView.autoScrollTimeInterval = 3
        sdScrollView.pageControlBottomOffset = -8
        self.bannerView.addSubview(sdScrollView)
        
        self.testBankView.frame = CGRect(x: 0, y: 300, width: kSCREEN_WIDTH, height: 100)
        self.headView.addSubview(self.testBankView)
 
    }

    @IBAction func clickFunctionButton(_ sender: UIButton) {
        
        
    }
    
    
    
}
