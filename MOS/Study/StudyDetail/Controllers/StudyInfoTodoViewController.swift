//
//  StudyInfoTodoViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class StudyInfoTodoViewController: UIViewController {
    @IBOutlet weak var todoView3: UIView!
    @IBOutlet weak var todoView2: UIView!
    @IBOutlet weak var todoView1: UIView!
    @IBOutlet var outlineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.layer.cornerRadius = 16
        todoView1.layer.cornerRadius = 8
        todoView2.layer.cornerRadius = 8
        todoView3.layer.cornerRadius = 8
    }
}
