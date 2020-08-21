//
//  HomeViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
  
    var tableView = UITableView()
    var dataArray = [HomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        getListData()
    }
    func createView() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView .register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
    }
    func getListData() {
        PNetwork.request(target: .toptenReviews, success: { (json) in
            print("json=\(json)")
            let baseString = Mapper<BaseDataModel>().map(JSONString: json as! String)
            if baseString?.code == 200 {
                if let array = baseString?.data as? [AnyObject] {
                    for homeModel in array {
                        let model = Mapper<HomeModel>().map(JSONObject: homeModel)
                        self.dataArray.append(model!)
                    }
                }
                self.tableView.reloadData()
            }
        }) {(error) in
           print("错误==\(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataArray.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeTableViewCell! = (tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell)!
        cell.selectionStyle = .none
        if indexPath.row < self.dataArray.count {
            let model = self.dataArray[indexPath.row]
            cell.setPassModel(model: model)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
