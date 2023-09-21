//
//  HomeViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var moveToTestView: UIView!
    @IBOutlet weak var showMoreStudies: UIImageView!
    @IBOutlet weak var navToSurveyBtn: UIView!
    @IBOutlet weak var studyCollectionView: UICollectionView!
    @IBOutlet weak var category1Btn: UIImageView!
    var pagingViewController: PagingViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        navToSurveyBtn.isUserInteractionEnabled = true
        let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped2))
        navToSurveyBtn.addGestureRecognizer(tap2Gesture)
        
        showMoreStudies.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        showMoreStudies.addGestureRecognizer(tapGesture)
        
        applyShadow()
        
        // 콜렉션 뷰에 대한 설정
        studyCollectionView.dataSource = self
        studyCollectionView.delegate = self
        
        studyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = studyCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        leadingConstraint.isActive = true
        
        let trailingConstraint = studyCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        trailingConstraint.isActive = true
    }
    
    @IBAction func category1BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToCategory" {
            if let pagingViewController = segue.destination as? PagingViewController {
                // 원하는 페이지로 selectedPageIndex를 설정
                pagingViewController.selectedPageIndex = 1 // 예: 1은 산업•기업 분석 페이지
            }
        }
    }
    
    @objc func imageTapped() {
        self.performSegue(withIdentifier: "navToCategory", sender: self)
    }
    
    @objc func imageTapped2() {
        print(#fileID, #function, #line, "- exitButton clicked")
        self.performSegue(withIdentifier: "navToSurvey", sender: self)
        let surveyViewController = SurveyVC()
        surveyViewController.hidesBottomBarWhenPushed = true
    }
    
    fileprivate func applyShadow() {
        print(#fileID, #function, #line, "shadow 적용 함수 접근")
        self.moveToTestView.layer.cornerRadius = 8
        self.moveToTestView.layer.shadowColor = UIColor.gray.cgColor // 색상
        self.moveToTestView.layer.shadowOpacity = 0.1 // alpha값
        self.moveToTestView.layer.shadowRadius = 10 // 반경
        self.moveToTestView.layer.shadowOffset = CGSize(width: 0, height: 0) // 위치조정
        self.moveToTestView.layer.masksToBounds = false
    }
}

// 데이터 소스 설정 - 데이터와 관련된 것들
extension HomeViewController: UICollectionViewDataSource {
    // 각 섹션에 들어가는 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // 각 콜렉션 뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 재사용 가능한 셀을 가져옴 (indexPath 번째)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyListCell", for: indexPath) as? StudyListCollectionViewCell else {
            // casting 실패 시
            return UICollectionViewCell()
        }
        
        let studyListItem = StudyList.list[indexPath.row] // indexPath.item 대신 indexPath.row 사용
        cell.configure(studyListItem)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let studyList = StudyList.list[indexPath.item]
        
        let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
        let titleText = studyList.title
        let titleMaxWidth = collectionView.bounds.width /* 패딩이나 제약조건 조절 */
        
        let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)
        
        // 제목 레이블 높이를 기반으로 원하는 셀 높이 계산
        let cellHeight = titleHeight + 130.0 /* 다른 셀 요소에 대한 높이 추가 */
        
        return CGSize(width: collectionView.bounds.width, height: cellHeight)
    }
}


