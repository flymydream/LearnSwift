//
//  MineTableViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/10/13.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    var leftImageView = UIImageView()
    var leftLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    func createView() {
        
        let bankView = UIView()
        self.contentView.addSubview(bankView)
        bankView.layer.cornerRadius = 5
        bankView.clipsToBounds = true
        self.contentView.addSubview(bankView)
        bankView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(12)
            make.right.equalTo(12)
            make.height.equalTo(46)
        }
        
        bankView.addSubview(leftImageView)
        leftImageView.image = UIImage.init(named: "关于我们")
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.centerY.equalTo(bankView)
        }
        
        leftLabel.textColor = kVALUE_RGB(rgbValue: 0x10202f)
        leftLabel.font = UIFont .systemFont(ofSize: 16)
        bankView.addSubview(leftLabel)
        leftLabel.text = "帮助中心"
        leftLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp_rightMargin).offset(15)
            make.centerY.equalTo(leftImageView)
        }
        
        let rightImageView = UIImageView()
        bankView.addSubview(rightImageView)
        rightImageView.image = UIImage.init(named: "设置右箭头")
        rightImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-22)
            make.width.equalTo(10)
            make.centerY.equalTo(leftLabel)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(image : String,title : String) {
        leftImageView.image = UIImage.init(named: image)
        leftLabel.text = title
    }

}
