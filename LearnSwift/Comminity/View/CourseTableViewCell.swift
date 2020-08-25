//
//  CourseTableViewCell.swift
//  LearnSwift
//
//  Created by 庞宏侠 on 2020/8/24.
//  Copyright © 2020 jiuhuikeji. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
   
    var lessonArray = [InstitutionsModel]()
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        createUIView()
    }
    func setLessonArray(num: Array<InstitutionsModel>) {
        lessonArray = num
        if num.count > 0 {
             collectionView.reloadData()
        }
    }

   func createUIView() {
         let layout = UICollectionViewFlowLayout()
         layout.itemSize = CGSize(width: 330*HEI, height: 316*HEI)
         layout.scrollDirection = .horizontal
         layout.minimumLineSpacing = 20*HEI
         layout.sectionInset = UIEdgeInsets.init(top: 0, left: 30*HEI, bottom: 0, right: 30*HEI)
         collectionView? = UICollectionView.init(frame: CGRect(x: 0*HEI, y: 54*HEI, width: kSCREEN_WIDTH, height: 330*HEI), collectionViewLayout: layout)
        collectionView?.register(UINib.init(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CourseCollectionViewCell")
     }
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          self.lessonArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CourseCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
          if indexPath.row < self.lessonArray.count  {
              let model = self.lessonArray[indexPath.row]
              cell.setPassModel(model: model)
          }
          return cell
       }
       
    
}
