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
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dynamic height 설정
        setHeightOnStudyOutline()

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
    
    func setHeightOnStudyOutline() {
        let con1 = StudyOutlineViewController()
        // 원하는 높이 값을 계산합니다. 이 예에서는 cellHeight로 가정합니다.
        let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
        let titleText =  StudyDetail.list.title
        let titleMaxWidth = containerVC1.bounds.width

        let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)
        print(titleHeight)
        let cellHeight = titleHeight + 120.0 /* 다른 셀 요소에 대한 높이 추가 */

        // NSLayoutConstraint에 새로운 높이 값을 할당합니다.
        heightConst.constant = cellHeight

        // Auto Layout 업데이트를 수행하여 제약 조건을 적용합니다.
        view.layoutIfNeeded()
           
    }
}


