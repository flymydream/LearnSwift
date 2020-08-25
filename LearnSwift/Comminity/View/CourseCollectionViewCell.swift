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
        
      let url = URL(string: kImage_Url+(model.honor_introduce ?? ""))
       iconImageView.kf.setImage(with: url)
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
