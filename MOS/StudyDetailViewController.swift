//
//  StudyDetailViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/06/08.
//

import UIKit

class StudyDetailViewController: UIViewController {
    
    @IBOutlet var studyDetailView: UIView!
    @IBOutlet weak var containerVC1: UIView!
    @IBOutlet weak var containerVC2: UIView!
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    @IBOutlet weak var heightConst2: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dynamic height 설정
        setDynamicHeight()

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
    
    func setDynamicHeight() {
        let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
        let textFont = UIFont.systemFont(ofSize: 16)
        let titleText =  StudyDetail.list.title
        let studyText = StudyDetail.list.studyRule
        let titleMaxWidth = containerVC1.bounds.width
        let studyMaxWidth = containerVC2.bounds.width

        let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)
        let studyHeight = studyText.height(withConstrainedWidth: studyMaxWidth, font: textFont)
        
        print(titleHeight)
        print(studyHeight)
        let cellHeight = titleHeight + 120.0 /* 다른 셀 요소에 대한 높이 추가 */
        let cellHeight2 = studyHeight + 120.0

        // NSLayoutConstraint에 새로운 높이 값을 할당합니다.
        heightConst.constant = cellHeight
        heightConst2.constant = cellHeight2

        // Auto Layout 업데이트를 수행하여 제약 조건을 적용합니다.
        view.layoutIfNeeded()
           
    }
}


