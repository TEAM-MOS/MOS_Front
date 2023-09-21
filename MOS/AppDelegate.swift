//
//  AppDelegate.swift
//  MOS
//
//  Created by yeonsu on 2023/05/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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
    

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let firstViewController = SurveyVC()
        navigationController = UINavigationController(rootViewController: firstViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

