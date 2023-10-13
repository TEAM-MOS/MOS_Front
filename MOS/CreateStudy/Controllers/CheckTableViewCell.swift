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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            // UITableViewCell의 레이아웃 설정
            setupLayout()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)

            // UITableViewCell의 레이아웃 설정
            setupLayout()
        }
    
    func set(title: String, checked: Bool) {
        label.text = title
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // 셀의 컨텐츠 뷰에 여백을 설정
        let margin: CGFloat = 4.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0))
        }
    
    private func setupLayout() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.backgroundColor = UIColor(hex: "FFE7E7")
        self.contentView.clipsToBounds = true
        }
    
    private func deleteCell() {
        
    }
}
