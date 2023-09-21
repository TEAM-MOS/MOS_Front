//
//  StudyOutlineViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/09/21.
//

import UIKit

class StudyOutlineViewController: UIViewController {
    
    @IBOutlet weak var category: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.category.text = StudyDetail.list.category
        
    }
}
