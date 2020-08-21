//
//  HomeTableViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/13.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import SnapKit
class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    var detailLabel = UILabel()
    var levelImageView = UIImageView()
    var model : HomeModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        titleLabel = UILabel.init()
        self.contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        titleLabel.textColor = MainTextColor
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
        }
        
        subTitleLabel = UILabel.init()
        self.contentView.addSubview(subTitleLabel)
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        subTitleLabel.textColor = MainSubTextColor
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(titleLabel)
        }
        
        detailLabel = UILabel.init()
        self.contentView.addSubview(detailLabel)
        detailLabel.textAlignment = .left
        detailLabel.textColor = MainSubTextColor
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleLabel.snp_bottomMargin).offset(5)
            make.left.equalTo(titleLabel)
        }
        
        let lineLabel = UILabel.init()
        self.contentView.addSubview(lineLabel)
        lineLabel.backgroundColor = kMainLinkColor
        lineLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        

       levelImageView = UIImageView.init()
       self.contentView.addSubview(levelImageView)
       levelImageView.snp.makeConstraints { (make) in
           make.top.equalTo(titleLabel.snp_bottomMargin).offset(2)
           make.right.equalTo(-15)
           make.height.equalTo(20)
       }
        
    }
    
    func setPassModel(model:HomeModel) {
        let btcNum = model.powerBTCModel?.countCalculationPower
        titleLabel.text = "BTC团队总算力:\(btcNum ?? 0)T"
        
        let pmeerNum = model.powerPMEERModel?.countCalculationPower
        subTitleLabel.text = "PMEER团队总算力:\(pmeerNum ?? 0)G"
        
        levelImageView.image = UIImage(named: "level_\(model.miningLevel ?? 0)")
    }
}
