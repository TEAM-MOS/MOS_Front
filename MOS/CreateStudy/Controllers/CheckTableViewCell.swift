//
//  CheckTableViewCell.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import UIKit

class CheckTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    func set(title: String, checked: Bool) {
        label.text = title
      }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            
            // 셀의 컨텐츠 뷰에 여백을 설정
            let margin: CGFloat = 4.0
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0))
        }
}
