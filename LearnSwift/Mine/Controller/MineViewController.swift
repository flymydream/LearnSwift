//
//  MineViewController.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/13.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
     var otcTableView = UITableView()
     var scrollView = UIScrollView()
     var headImageView = UIImageView()
     var nameLabel = UILabel()
     var nickLabel = UILabel()
     var firstImageArr = [String]()
     var firstTitleArr = [String]()
     var secondImageArr = [String]()
     var secondTitleArr = [String]()
    
     
    override func viewDidLoad() {
        self.view.backgroundColor = kVALUE_RGB(rgbValue: 0xf2f2f2)
        firstTitleArr = ["法币订单","商户管理","申诉审批"]
        firstImageArr = ["法币订单","商户管理","申诉审批"]
        secondImageArr = ["法币订单","商户管理","申诉审批","法币订单","商户管理","申诉审批"]
        secondTitleArr = ["币币订单","交易持仓","邀请返佣","安全中心","关于我们","帮助中心"]
        createTableView()
        self.otcTableView.reloadData()
    }
    
    func createTableView() {
        
        scrollView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
        self.view.addSubview(scrollView)
        
        let topHeadView = UIView()
        topHeadView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: 200)
     
        let topContentView = UIView()
        topContentView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: 140)
        topHeadView.addSubview(topContentView)
        
        let topImageView = UIImageView()
        topImageView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: 140)
        topContentView.addSubview(topImageView)
        topImageView.image = UIImage.init(named: "商户信息背景")
        
        headImageView.frame = CGRect.init(x: 12, y: 25, width: 60, height: 60)
        topContentView.addSubview(headImageView)
        headImageView.layer.cornerRadius = 30
        headImageView.clipsToBounds = true
        headImageView.image = UIImage.init(named: "头像")
        
        //姓名
        nameLabel.text = "18592079288"
        topContentView.addSubview(nameLabel)
        nameLabel.textColor = kVALUE_RGB(rgbValue: 0xC1C7D7)
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headImageView.snp_rightMargin).offset(16)
            make.top.equalTo(headImageView.snp_topMargin).offset(5)
        }
        //昵称
        nickLabel.text = "碎花裙的店铺"
        topContentView.addSubview(nickLabel)
        nickLabel.textColor = kVALUE_RGB(rgbValue: 0xC1C7D7)
        nickLabel.font = UIFont.systemFont(ofSize: 14)
        nickLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(10)
        }
        
        let userImageView = UIImageView()
        topContentView.addSubview(userImageView)
        userImageView.image = UIImage.init(named: "商家认证")
        userImageView.snp.makeConstraints { (make) in
            make.left.equalTo(nickLabel.snp.right).offset(5)
            make.centerY.equalTo(nickLabel)
        }
        
        //白色view
        let whiteBankView = UIView()
        whiteBankView.backgroundColor = UIColor.white
        topHeadView.addSubview(whiteBankView)
        whiteBankView.layer.cornerRadius = 5
        whiteBankView.clipsToBounds = true
        whiteBankView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(12)
            make.height.equalTo(90)
            make.right.equalTo(-12)
        }
        
        
        let lineLable = UILabel()
        whiteBankView.addSubview(lineLable)
        lineLable.backgroundColor = kVALUE_RGB(rgbValue: 0xf2f2f2)
        lineLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(whiteBankView)
            make.centerY.equalTo(whiteBankView)
            make.width.equalTo(0.5)
            make.height.equalTo(58)
        }
        
        
        let assetImageView = UIImageView()
        whiteBankView.addSubview(assetImageView)
        assetImageView.image = UIImage.init(named: "新资产")
        assetImageView.snp.makeConstraints { (make) in
            make.top.equalTo(22)
            make.left.equalTo(94)
            make.width.height.equalTo(22)
        }
        
        let assetLabel = UILabel()
        whiteBankView.addSubview(assetLabel)
        assetLabel.textAlignment = .center
        assetLabel.textColor = kVALUE_RGB(rgbValue: 0x10202f)
        assetLabel.font = UIFont.systemFont(ofSize: 14)
        assetLabel.text = "资产"
        assetLabel.snp.makeConstraints { (make) in
            make.top.equalTo(assetImageView.snp.bottomMargin).offset(10)
            make.centerX.equalTo(assetImageView)
        }
        
        
        let wishImageView = UIImageView()
       whiteBankView.addSubview(wishImageView)
       wishImageView.image = UIImage.init(named: "心愿理财")
       wishImageView.snp.makeConstraints { (make) in
           make.top.equalTo(22)
           make.right.equalTo(-94)
           make.width.height.equalTo(20)
       }
       
       let wishLabel = UILabel()
       whiteBankView.addSubview(wishLabel)
       wishLabel.textAlignment = .center
       wishLabel.textColor = kVALUE_RGB(rgbValue: 0x10202f)
       wishLabel.font = UIFont.systemFont(ofSize: 14)
       wishLabel.text = "心愿理财"
       wishLabel.snp.makeConstraints { (make) in
           make.top.equalTo(wishImageView.snp.bottomMargin).offset(10)
           make.centerX.equalTo(wishImageView)
       }
    
        
        otcTableView = UITableView.init(frame: CGRect.init(x: 0, y:0 , width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT), style: .grouped)
        scrollView.addSubview(otcTableView)
        otcTableView.delegate = self
        otcTableView.dataSource = self
        otcTableView.register(MineTableViewCell.self, forCellReuseIdentifier: "MineTableViewCell")
        otcTableView.tableHeaderView = topHeadView
        
        scrollView.contentSize = CGSize.init(width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MineTableViewCell", for: indexPath) as! MineTableViewCell
        if indexPath.section == 0 {
            cell.setData(image: firstImageArr[indexPath.row], title: firstTitleArr[indexPath.row])
        } else {
            cell.setData(image: secondImageArr[indexPath.row], title: secondTitleArr[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if section == 0 {
           return 3
       } else {
           return 6
       }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: 10)
        headView.backgroundColor = kVALUE_RGB(rgbValue: 0xf2f2f2)
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了当前cell")
    }
    
}


