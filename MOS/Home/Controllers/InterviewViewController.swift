//
//  InterviewViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/06/20.
//

import UIKit

class InterviewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var recruitingSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 모집 중 스위치 사이즈 조절
        recruitingSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);

        // 콜렉션 뷰 생성 및 설정
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        leadingConstraint.isActive = true
        
        let trailingConstraint = collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        trailingConstraint.isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StudyList.listInterview.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용 가능한 셀을 가져옴 (indexPath 번째)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyListCell", for: indexPath) as? StudyListCollectionViewCell else {
            // casting 실패 시
            return UICollectionViewCell()
        }
        
        let studyListCell = StudyList.listInterview[indexPath.item]
        // indexPath 안에는 섹션에 대한 정보, 섹션에 들어가는 데이터 정보 등이 있다
        cell.configure(studyListCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = StudyList.listInterview[indexPath.item]
        
        if let studyDetailVC = UIStoryboard(name: "Study", bundle: nil).instantiateViewController(withIdentifier: "studyDetailVC") as? StudyDetailViewController {
                self.navigationController?.pushViewController(studyDetailVC, animated: false)
            }
    }
}

extension InterviewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let studyList = StudyList.listInterview[indexPath.item]
        
        let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
        let titleText = studyList.title
        let titleMaxWidth = collectionView.bounds.width /* 패딩이나 제약조건 조절 */
        
        let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)
        
        // 제목 레이블 높이를 기반으로 원하는 셀 높이 계산
        let cellHeight = titleHeight + 130.0 /* 다른 셀 요소에 대한 높이 추가 */
        
        return CGSize(width: collectionView.bounds.width, height: cellHeight)
    }
}


