//
//  FinishVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/27.
//

import Foundation
import UIKit
class FinishVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func gotoHomeBtnTapped(_ sender: Any) {
        if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 0 // 0은 첫 번째 탭을 나타냅니다. 적절한 인덱스로 변경하세요.
            }
    }
}
