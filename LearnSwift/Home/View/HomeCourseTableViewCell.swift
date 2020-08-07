//
//  HomeCourseTableViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/7/30.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit


protocol HomeCourseTableViewCellDelegate {
    func didSelectItemAt(institutionId:String)
}

class HomeCourseTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    var collectionView : UICollectionView?
    let titleLab = UILabel()
    var type : NSInteger?
    
    var homeModel : HomeModel?
    var courseModel : CourseHeaderModel?
    var delegate:HomeCourseTableViewCellDelegate?
    let courseCollectionCell = "HomeCourseCollectionViewCell"
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setPassData(model: HomeModel) {
        self.homeModel = model
        self.collectionView?.reloadData()
    }
    
    //课程model
    func setPassCourseData(model:CourseHeaderModel) {
        self.courseModel = model
        self.collectionView?.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.type == 1 || self.type == 2 {
            if self.homeModel == nil {
                return 0
            } else {
                if self.type == 1 {//推荐机构
                    return self.homeModel?.institutions?.count ?? 0
                } else { //推荐课程
                    return self.homeModel?.lessons?.count ?? 0
                }
            }
        } else {//热门课程
            if self.courseModel == nil {
                return 0
            } else {
                return self.courseModel?.lessons_hot?.count ?? 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aCell : HomeCourseCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: courseCollectionCell, for: indexPath) as! HomeCourseCollectionViewCell
        if type == 1 { //推荐机构
             aCell.model = self.homeModel?.institutions?[indexPath.row]
        } else if type == 2{
            aCell.setPassData(model: (self.homeModel?.lessons?[indexPath.row])!)
        } else {
            aCell.setPassCourseData(model:(self.courseModel?.lessons_hot?[indexPath.row])!)
        }
        aCell.backgroundColor = UIColor.white
        return aCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model : HomeInstitutionsModel = (self.homeModel?.institutions?[indexPath.row])!
        self.delegate?.didSelectItemAt(institutionId: model.id ?? "0")
    
    }
    
    
    
    

}
