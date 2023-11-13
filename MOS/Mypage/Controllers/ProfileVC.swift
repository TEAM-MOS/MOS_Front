//
//  profileVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/14.
//

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = UIColor(hex: "F9F9F9")
        view1.layer.cornerRadius = 8
        view2.backgroundColor = UIColor(hex: "F9F9F9")
        view2.layer.cornerRadius = 8
        view3.backgroundColor = UIColor(hex: "FFE7E7")
        view3.layer.cornerRadius = 10
        view4.backgroundColor = UIColor(hex: "FFE7E7")
        view4.layer.cornerRadius = 10
        
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
