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
}
