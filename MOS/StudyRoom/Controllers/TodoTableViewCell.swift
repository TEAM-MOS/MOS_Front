//
//  TodoTableViewCell.swift
//  MOS
//
//  Created by yeonsu on 11/20/23.
//

import UIKit

protocol DeleteTodoTableViewCellDelegate: AnyObject {
    func didClickDeleteButton(_ cell: TodoTableViewCell, didDeleteBtneClicked: Bool)
}

class TodoTableViewCell: UITableViewCell {
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    
    weak var delegate: DeleteTodoTableViewCellDelegate?
    
    @IBAction func clicked(_sender: UIButton){
        delegate?.didClickDeleteButton(self,didDeleteBtneClicked: true)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        self.contentView.backgroundColor = .clear
        self.contentView.clipsToBounds = true
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor(named: "inactive_button_bg")?.cgColor
    }
}
