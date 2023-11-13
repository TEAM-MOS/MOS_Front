//
//  ApprovalDetailVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/13.
//

import Foundation
import UIKit

class ApprovalDetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
