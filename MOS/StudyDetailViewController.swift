//
//  StudyDetailViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/06/08.
//

import UIKit

class StudyDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 수정
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "스터디 정보"
        
    }
}


