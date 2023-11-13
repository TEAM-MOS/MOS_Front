//
//  ApprovalDetailVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/13.
//

import Foundation
import UIKit

class ApprovalDetailVC: UIViewController {
    
    @IBOutlet weak var studyTitleView: UIView!
    @IBOutlet weak var approvalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // studyTitleView의 배경색과 왼쪽 모서리 corner-radius 설정
       studyTitleView.backgroundColor = UIColor(hex: "F3F3F3")
       studyTitleView.layer.cornerRadius = 8
       studyTitleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
               
       // approvalView의 배경색과 오른쪽 모서리 corner-radius 설정
       approvalView.backgroundColor = UIColor(hex: "D9D9D9")
       approvalView.layer.cornerRadius = 8
       approvalView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    
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
