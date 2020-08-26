//
//  CourseCollectionViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/24.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import Kingfisher

class CourseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var labButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        labButton.layer.cornerRadius = 5
        labButton.clipsToBounds = true
        iconImageView.layer.cornerRadius = 5
        iconImageView.clipsToBounds = true
        
    }
    
    func setPassModel(model:InstitutionsModel) {
        
        let url = URL(string: kImageUrl+(model.institutionIdChange?.image ?? ""))
       iconImageView.kf.setImage(with: ？"https://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=%E5%B0%8F%E7%8C%AB&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=undefined&hd=undefined&latest=undefined&copyright=undefined&cs=2704608031,2513602152&os=760648725,4219172028&simid=3311139080,191231791&pn=4&rn=1&di=225060&ln=1903&fr=&fmq=1598411421445_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&istype=0&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=0&hs=2&objurl=http%3A%2F%2Fdpic.tiankong.com%2Fkl%2F5m%2FQJ6686106193.jpg&rpstart=0&rpnum=0&adpicid=0&force=undefined&ctd=1598411431080^3_1859X808%1")
       titleLabel.text = model.title ?? ""
       subTitleLabel.text = model.institutiontags ?? ""
       labButton.backgroundColor = kVALUE_RGB(rgbValue: 0xE68E00)
       labButton .setTitle("精品", for: .normal)
       let price_str = "68.00"
       if Float(price_str)! > 0 {
           priceLabel.text = "¥68.00"
       }else {
           priceLabel.text = "¥699.00"
       }
        
    }

      

}
