//
//  HomeCourseCollectionViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class HomeCourseCollectionViewCell: UICollectionViewCell {
    
    var mainImg = UIImageView()
    var titleLab = UILabel()
    var lableLab = UILabel()
    var priceLab = UILabel()
    var labButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialiseUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //首页
    var model : HomeInstitutionsModel? {
        didSet {
            let url = URL(string: kImage_Url+(model?.banner_img_change?.image ?? ""))
            mainImg.kf.setImage(with: url)
            titleLab.text = model?.title
            lableLab.text = model?.institutiontags
            priceLab.isHidden = true
        }
        
    }
    
    
    func setPassData(model:HomeLessonModel) {
        priceLab.isHidden = false
        let url = URL(string: kImage_Url+(model.banner_img_change!.image))
        mainImg.kf.setImage(with: url)
        titleLab.text = model.title
        lableLab.text = model.lessontags
        labButton.backgroundColor = kVALUE_RGB(rgbValue: 0xE68E00)
        labButton.setTitle("精品", for: .normal)
        let price_str = model.total_price!
        if Float(price_str)! > 0 {
            priceLab.text = "¥"+model.total_price!
        } else {
            priceLab.text = "¥"+model.single_price!
        }
    }
    //课程
    func setPassCourseData(model:CourseHeaderLessonsHotModel) {
        priceLab.isHidden = false
        let url = URL(string: kImage_Url+(model.banner_img_change!.image))
        mainImg.kf.setImage(with: url)
        titleLab.text = model.title
        lableLab.text = model.lessonsTags
        labButton.backgroundColor = kVALUE_RGB(rgbValue: 0xE68E00)
        let price_str = model.total_price!
        if Float(price_str)! > 0 {
            priceLab.text = "$"+model.total_price!
        } else {
            priceLab.text = "$"+model.single_price!
        }
        
        
    }
    //个人中心
    func setPassPrifileLesson(model:ProfileLikeModel) {
        priceLab.isHidden = false
        let url = URL(string: kImage_Url+(model.banner_img_change!.image))
        mainImg.kf.setImage(with: url)
        titleLab.text = model.title
        lableLab.text = model.lessontags
        labButton.backgroundColor = kVALUE_RGB(rgbValue: 0xE68E00)
        labButton.setTitle("精品", for: .normal)
        let price_str = model.total_price!
        if Float(price_str)! > 0 {
            priceLab.text = "$"+model.total_price!
        } else {
            priceLab.text = "$"+model.single_price!
        }
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
        
        priceLab.text = "¥2640.00"
        priceLab.font = UIFont.init(name: DINMedium, size: 16)
        priceLab.textColor = kVALUE_RGB(rgbValue: 0xD45C3B)
        self.addSubview(priceLab)
        priceLab.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(lableLab.snp.bottom).offset(20*HEI)
            make.height.equalTo(32*HEI)
            make.right.equalTo(0)
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
