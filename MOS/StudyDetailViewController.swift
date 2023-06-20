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
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "bc-studyDetail")
        navigationItem.title = "스터디 정보"
        
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        // 신청하기 버튼 클릭 시 화면 이동
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PreQuestionAlertVC") as? PreQuestionAlertViewController else { return }
        nextVC.modalPresentationStyle = .overCurrentContext
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
}


