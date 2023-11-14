//
//  StudyListCollectionViewCell.swift
//  MOS
//
//  Created by yeonsu on 2023/08/18.
//

import UIKit

class StudyListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var category_bc: UIView!
    @IBOutlet weak var bcView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var member: UILabel!
    
    @IBOutlet weak var bcView_location: UIView!
    @IBOutlet weak var bcView_date: UIView!
    @IBOutlet weak var bcView_member: UIView!
    
    func configure(_ study: StudyList) {
        category.text = "\(study.category)"
        title.text = "\(study.title)"
        image.image = UIImage(named: study.imageName)
        location.text = "\(study.location)"
        date.text = "\(study.date)"
        member.text = "\(study.member)"
        
        if category.text == "산업&기업 분석" {
            category.textColor = UIColor(named: "label-category-1")
        } else if category.text == "인/적성" {
            category.textColor = UIColor(named: "label-category-3")
        } else if category.text == "어학" {
            category.textColor = UIColor(named: "label-category-6")
        } else if category.text == "면접" {
            category.textColor = UIColor(named: "label-category-5")
        } else if category.text == "시사 PT" {
            category.textColor = UIColor(named: "label-category-2")
        } else if category.text == "자소서" {
            category.textColor = UIColor(named: "label-category-4")
        }
        
        category_bc.layer.cornerRadius = category_bc.frame.height / 2
        
        self.bcView_location.layer.cornerRadius = 4
        self.bcView_date.layer.cornerRadius = 4
        self.bcView_member.layer.cornerRadius = 4
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }
    
    private func setCornerRadius() {
        //print("shadow 함수 호출")
        self.bcView.layer.cornerRadius = 16 // 셀의 모서리를 둥글게 만들기 위해 설정
        
    }
}



// ====== ✨ collection view dynamic height ======
// 특정 폰트와 너비에 따른 문자열의 높이 계산

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
