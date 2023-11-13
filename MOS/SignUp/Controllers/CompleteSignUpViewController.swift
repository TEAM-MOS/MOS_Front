//
//  CompleteSignUpViewController.swift
//  MOS
//
//  Created by yeonsu on 11/7/23.
//

import UIKit

class CompleteSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToLoginVC(_ sender: Any) {
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController is LoginViewController {
                    navigationController?.popToViewController(viewController, animated: true)
                    break
                }
            }
        }
    }
}
