//
//  CommunityViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/20.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper
class CommunityViewController: BaseViewController,SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet var headView: UIView!
    @IBOutlet weak var bannerView: UIView!
    var sdScrollView = SDCycleScrollView()
    var bannerArray = [InstitutionIdChangeModel]()
    var institusionArray = [InstitutionsModel]()
    var lessaonsArray = [InstitutionsModel]()
    
    
    @IBOutlet weak var testBankView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initSDView()
        getListData()
    }

    func getListData() {
        PNetwork.request(target: .courseList, success: { (json) in
          let baseString = Mapper<BaseDataModel>().map(JSONString: json as! String)
          if baseString?.code == 200 {
            let courseModel = Mapper<CourseModel>().map(JSONObject: baseString?.data)
            if courseModel != nil {
                self.institusionArray = courseModel!.institutions
                self.lessaonsArray  = courseModel!.lessons
            }
//            self.sdScrollView.imageURLStringsGroup =
            self.tableView.reloadData()
        }
      }) {(error) in
          print("error=\(error)")
      }
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell : CourseTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CourseTableViewCell") as? CourseTableViewCell
          cell.selectionStyle = .none
        if let lesson : [InstitutionsModel] = lessaonsArray {
            cell.setLessonArray(num: lesson)
        } else {
            print("数组中出错")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
         return 195
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
        
        self.tableView.tableHeaderView = self.headView
        tableView.register(UINib.init(nibName: "CourseTableViewCell", bundle: nil), forCellReuseIdentifier: "CourseTableViewCell")
        
    }

    @IBAction func clickFunctionButton(_ sender: UIButton) {
        
        
    }
    
    
    
}
