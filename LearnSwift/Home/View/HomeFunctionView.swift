//
//  HomeFunctionView.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit


@objc protocol  HomeFunctionViewDelegate {
  @objc optional func HomeFunctionClick(view:HomeFunctionView,index:NSInteger)
}



class HomeFunctionView: UIView {
    var delegate : HomeFunctionViewDelegate?
    let imageArr = ["home_icon_xuefu__nor","home_icon_agency_nor","home_icon_course_nor","home_icon_course_nor"]
    let titleArr = ["学府正声","机构导览","在线课程","艺学咨询"]
    
     override init(frame: CGRect) {
        super.init(frame: frame)
           initTiaLiseUI()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    func initTiaLiseUI()  {
        let viewW : CGFloat = kSCREEN_WIDTH/CGFloat(imageArr.count)
        for index in 0..<imageArr.count {
            
            let mainView = UIView()
            
            mainView.tag = index
            mainView.frame = CGRect(x: 0, y: viewW*CGFloat(index), width: viewW, height: 220*HEI)
            self.addSubview(mainView)
            
            let imageView = UIImageView()
            imageView.frame = CGRect(x: viewW/2-55*HEI, y: 30*HEI, width: 110*HEI, height: 110*HEI)
            imageView.image = UIImage(named: imageArr[index])
            mainView.addSubview(imageView)
            
            //lable
            let lab = UILabel()
            lab.text = titleArr[index]
            lab.frame = CGRect(x: 0, y: imageView.frame.maxY + 16*HEI, width: viewW, height: 24*HEI)
            lab.textAlignment = .center
            lab.textColor = kRGBA(R: 0, G: 0, B: 0, A: 0.6)
            mainView.addSubview(lab)
            
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapClickButton))
            mainView.addGestureRecognizer(tap)
        }
    }
    
    @objc func tapClickButton(currentIndex:NSInteger) {
        self.delegate?.HomeFunctionClick?(view: self, index: currentIndex)
    }
    
    
    
    

}
