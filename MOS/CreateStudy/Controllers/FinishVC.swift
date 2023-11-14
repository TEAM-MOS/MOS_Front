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
                tabBarController.selectedIndex = 0
            }

            // 현재 뷰 컨트롤러를 스택에서 삭제하고 이전 화면으로 돌아가려면 아래 코드를 사용합니다.
            if let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated:  false)
            }
        }
    
}
