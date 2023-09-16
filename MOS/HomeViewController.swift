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

    // StudyList 데이터 배열
    fileprivate let studyList = [
        StudyList(category: "산업&기업 분석", title: "2023년 상반기 네이버 IT직군 면접 준비 스터디원 모집합니다 :)", imageName: "ic_home_category1", location: "송파구", date: "2/14(토)", member: "3/4"),
        StudyList(category: "인/적성", title: "IBK기업은행 공채 준비하는 사람들 모임", imageName: "ic_home_star", location: "동작구", date: "3/12(월)", member: "1/4"),
        StudyList(category: "어학", title: "오픽은 선택 아닌 필수인 스터디", imageName: "circle", location: "노원구", date: "3/2(월)", member: "3/6"),
        StudyList(category: "1", title: "3", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4"),
        StudyList(category: "1", title: "3", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4")
    ]

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
        studyCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        studyCollectionView.dataSource = self
        studyCollectionView.delegate = self
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

        let studyListItem = studyList[indexPath.row] // indexPath.item 대신 indexPath.row 사용
        cell.configure(studyListItem)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let studyListItem = studyList[indexPath.item]

        let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
        let titleText = studyListItem.title
        let titleMaxWidth = collectionView.bounds.width - 32 // 패딩이나 제약조건 조절

        let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)

        // 다른 셀 요소에 대한 높이 계산
        let imageHeight: CGFloat = 120.0 // 이미지 뷰의 높이
        let locationDateMemberHeight: CGFloat = 30.0 // 위치, 날짜, 멤버 레이블 높이 합

        // 셀의 높이 계산
        let cellHeight = titleHeight + imageHeight + locationDateMemberHeight + 16.0 /* 다른 간격 및 여백 */

        return CGSize(width: collectionView.bounds.width, height: cellHeight)
    }
}


