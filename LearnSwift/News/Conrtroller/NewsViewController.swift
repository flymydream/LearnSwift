//
//  NewsViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/13.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import ObjectMapper
class NewsViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
  
    var tableView = UITableView()
    var dataArray = [NewsModel]()
    
    override func viewDidLoad() {
        initUIViews()
        getListData()
    }
    func getListData() {
        PNetwork.request(target: .advisory, success: { (json) in
            let baseString = Mapper<BaseDataModel>().map(JSONString: json as! String)
            if baseString?.code == 200 {
                if let array = baseString?.data as? [AnyObject]  {
                    for newsModel in array {
                        let model = Mapper<NewsModel>().map(JSONObject: newsModel)
                        self.dataArray.append(model!)
                    }
                    self.tableView.reloadData()
                }
            }
        }) {(error) in
            print("error=\(error)")
        }
    }
    
    func initUIViews() {
        tableView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        let headView = UIView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 20))
        tableView.tableHeaderView = headView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        cell.selectionStyle = .none
        if indexPath.row < self.dataArray.count  {
            let model = self.dataArray[indexPath.row]
            cell.setPassModel(model: model)
        }
        cell.clickRowBlock = { [weak self] (params) in
            print("点击了第\(params)行")
        }
        return cell
    }
    
}
