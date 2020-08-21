//
//  NewsTableViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/19.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var clickRowBlock: ((_ params: Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    func setPassModel(model:NewsModel) {
        if  let time = model.createTime {
              let timeStap = String(describing: time)
              self.timeLabel.text = timeStap.timeStampToString(timeStamp: timeStap, DateFormat: "yyyy-MM-dd HH:mm:ss")
        }
        self.detailLabel.text = model.content
        self.titleLabel.text = model.title
    }
    
    @IBAction func clickShareButton(_ sender: UIButton) {
       guard let closure = clickRowBlock else { return }
       closure(sender.tag)
    }
    
  
    
}
