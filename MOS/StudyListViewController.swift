//
//  StudyListViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/08/18.
//

import UIKit

class StudyListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StudyList.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 재사용 가능한 셀을 가져옴 (indexPath 번째)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyListCell", for: indexPath) as? StudyListCollectionViewCell else {
            // casting 실패 시
            return UICollectionViewCell()
        }
        
        let studyListCell = StudyList.list[indexPath.item]
        // indexPath 안에는 섹션에 대한 정보, 섹션에 들어가는 데이터 정보 등이 있다
        cell.configure(studyListCell)
        return cell
    }


    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}



extension StudyListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // collectionView width와 동일하게 설정
        return CGSize(width: collectionView.bounds.width, height: 180)
    }
}
