//
//  CheckTableViewCell.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import UIKit

protocol DeleteTableViewCellDelegate: AnyObject {
    func didClickDeleteButton(_ cell: CheckTableViewCell, didDeleteBtneClicked: Bool)
}

class CheckTableViewCell: UITableViewCell {
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    
    weak var delegate: DeleteTableViewCellDelegate?
    
    @IBAction func clicked(_sender: UIButton){
        delegate?.didClickDeleteButton(self,didDeleteBtneClicked: true)
    }
    
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
        todoText.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 셀의 컨텐츠 뷰에 여백을 설정
        let margin: CGFloat = 4.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0))
    }
    
    private func setupLayout() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.backgroundColor = UIColor(named: "subColor")
        self.contentView.clipsToBounds = true
    }
    
    private func deleteCell() {
        
    }
}
