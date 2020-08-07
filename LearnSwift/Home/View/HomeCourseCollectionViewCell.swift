//
//  HomeCourseCollectionViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class HomeCourseCollectionViewCell: UICollectionViewCell {
    
    var mainImg = UIImageView()
    var titleLab = UILabel()
    var lableLab = UILabel()
    var priceLab = UILabel()
    var labButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialiseUI() {
        mainImg.image = UIImage(named: "plhold16:9")
        mainImg.layer.cornerRadius = 8*HEI
        mainImg.layer.masksToBounds = true
        self.addSubview(mainImg)
        mainImg.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(186*HEI)
            make.width.equalTo(330*HEI)
        }
        
        labButton.backgroundColor = kVALUE_RGB(rgbValue: 0xE68E00)
        labButton.setTitle("优质", for: .normal)
        labButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        mainImg.addSubview(labButton)
        labButton.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(24*HEI)
            make.width.equalTo(60*HEI)
        }
        
        titleLab.text = "乐享艺术体验中心"
        titleLab.font = UIFont.init(name: PF_Medium, size: 14)
        titleLab.textColor =  kRGBA(R: 0, G: 0, B: 0, A: 0.8)
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(mainImg.snp.bottom).offset(10*HEI)
            make.height.equalTo(28*HEI)
            make.right.equalTo(0)
        }
        
        lableLab.text = "长安区 / 器乐"
        lableLab.font = UIFont.init(name: PF_Regular, size: 11)
        lableLab.textColor = kRGBA(R: 0, G: 0, B: 0, A: 0.4)
        self.addSubview(lableLab)
        lableLab.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(titleLab.snp.bottom).offset(10*HEI)
            make.height.equalTo(22*HEI)
            make.right.equalTo(0)
        }
        
        
    }
    
    
    
    
    
    
    
    
    
}
