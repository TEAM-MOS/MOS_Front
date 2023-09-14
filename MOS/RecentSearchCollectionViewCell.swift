//
//  RecentSearchCollectionViewCell.swift
//  MOS
//
//  Created by yeonsu on 2023/08/25.
//

import UIKit

class RecentSearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recentSearchBcView: UIView!
    
    @IBOutlet weak var recentSearchText: UILabel!
    
    @IBOutlet weak var deleteButton: CustomButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = recentSearchText.frame.size.height / 2.5
        self.backgroundColor = .lightGray
        self.recentSearchText.textColor = .black
        let leadingConstraint = recentSearchBcView.leadingAnchor.constraint(equalTo: recentSearchText.leadingAnchor, constant: -20)
               // Activate the constraint
               leadingConstraint.isActive = true
    }
}

class CustomButton: UIButton {
    var section: Int = 0
    var row : Int = 0
}
