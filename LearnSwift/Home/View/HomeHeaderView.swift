//
//  HomeHeaderView.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

protocol HomeHeaderViewDelegate {
    
    func homeHeaderFunctionClick(view:HomeHeaderView,index:NSInteger)
    //轮播图事件
    func homeBannerClick(view:HomeHeaderView,index:NSInteger)
    
    func homeCePingClick()
    
}


class HomeHeaderView: UIView,SDCycleScrollViewDelegate,HomeFunctionViewDelegate {
       
    var bannerView = SDCycleScrollView()
    let animationView = AnimationView()
    
    var delegate:HomeHeaderViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialiseUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //数据绑定
    var model : HomeModel {
        didSet {
            let  
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
       
    func HomeFunctionClick(view: HomeFunctionView, index: NSInteger) {
        self.delegate?.homeHeaderFunctionClick(view: self, index: index)
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        self.delegate?.homeBannerClick(view: self, index: index)
    }
    

    
    func initialiseUI() {
        self.bannerView = SDCycleScrollView()
        self.bannerView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 422*HEI)
        self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        self.bannerView.currentPageDotImage = UIImage(named: "sliding indicator_sel")
        self.bannerView.pageDotImage = UIImage(named: "sliding indicator_nor")
        self.bannerView.autoScrollTimeInterval = 3
        self.bannerView.pageControlBottomOffset = -8*HEI
        self.addSubview(self.bannerView)
        //功能区
        let functionView = HomeFunctionView.init(frame: CGRect(x: 0, y: self.bannerView.frame
            .maxY, width: kSCREEN_WIDTH, height: 220*HEI))
        functionView.delegate = self
        self.addSubview(functionView)
        //测评
        
        let bottomView = UIView.init()
        bottomView.frame = CGRect(x: 30*HEI, y: functionView.frame.maxY, width: kSCREEN_WIDTH-60*HEI, height: 226*HEI)
        
        let animations = Animation.named("lottie (3)")
        animationView.animation = animations
        animationView.frame = bottomView.frame
        animationView.contentMode = .scaleAspectFit
        bottomView.addSubview(animationView)
        
        //循环播放
        animationView.loopMode = .loop
        animationView.play()
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(cepingCilck))
        bottomView.addGestureRecognizer(tap)
        
        let lineView = UIView()
        self.addSubview(lineView)
        lineView.backgroundColor = kRGB(R: 245, G: 249, B: 252)
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-30*HEI)
            make.height.equalTo(10*HEI)
        }
        
        
        
        func cepingCilck() {
            self.delegate?.homeCePingClick()
        }
        
        
    }
    
    
}
