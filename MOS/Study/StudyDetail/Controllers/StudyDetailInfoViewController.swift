//
//  StudyDetailInfoViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class StudyDetailInfoViewController:UIViewController {
    
    @IBOutlet var outlineView: UIView!
    @IBOutlet weak var infoText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoText.text = StudyDetail.list.studyRule
        
        outlineView.layer.cornerRadius = 16
        
    }
    
    
}
