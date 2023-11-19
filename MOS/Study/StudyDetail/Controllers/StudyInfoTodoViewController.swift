//
//  StudyInfoTodoViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class StudyInfoTodoViewController: UIViewController {
    @IBOutlet var outlineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.layer.cornerRadius = 16
    }
}
