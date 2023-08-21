//
//  StudyListCollectionViewCell.swift
//  MOS
//
//  Created by yeonsu on 2023/08/18.
//

import UIKit

class StudyListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var member: UILabel!
    
    
    func configure(_ study: StudyList) {
        category.text = "\(study.category)"
        title.text = "\(study.title)"
        image.image = UIImage(named: study.imageName)
        location.text = "\(study.location)"
        date.text = "\(study.date)"
        member.text = "\(study.member)"
    }

}
