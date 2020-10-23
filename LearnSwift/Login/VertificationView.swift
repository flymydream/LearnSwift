//
//  VertificationView.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/10/19.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

protocol VertificationViewDelegate{
    func clickGetCodeButton()
    func clickConfirmButton()
}


class VertificationView: UIView {

    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    
    var delegate : VertificationViewDelegate?
     required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
       super.init(frame: frame)
        let nibViewArr : Array? = Bundle.main.loadNibNamed("VertificationView", owner: self, options: nil)
        let backView : UIView = nibViewArr?.first as! UIView
        backView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
        self.addSubview(backView)
    }
    
   
    
    @IBAction func clickGetCodeButton(_ sender: UIButton) {
      self.delegate?.clickGetCodeButton()
    }
    @IBAction func clickSureButton(_ sender: UIButton) {
        self.removeFromSuperview()
        self.delegate?.clickConfirmButton()
    }
    
    
    @IBAction func clickCancleButton(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    func setAccount(account:String) {
        self.phoneLabel.text = account
    }
}
