//
//  StudyMemberInfoViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class StudyMemberInfoViewController:UIViewController {
    @IBOutlet var outlineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.layer.cornerRadius = 16
    }
}
