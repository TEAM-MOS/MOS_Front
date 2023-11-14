//
//  MyStudy.swift
//  MOS
//
//  Created by 김지은 on 2023/11/14.
//

import Foundation
import UIKit
class MystudyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBottomBarWhenPushed = true
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        guard let navigationControllers = self.navigationController?.viewControllers else { return }
        for viewController in navigationControllers {
            print(viewController)
            if let previousVC = viewController as? MyPageViewController {
                self.navigationController?.popToViewController(previousVC, animated: false)
                break
            }
        }
        
    }
}
