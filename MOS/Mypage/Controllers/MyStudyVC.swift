//
//  MyStudy.swift
//  MOS
//
//  Created by 김지은 on 2023/11/14.
//

import Foundation
import UIKit
class MystudyVC: UIViewController {
    
    
    @IBOutlet weak var bgVIiew: UIView!
    @IBOutlet weak var profile6: UIImageView!
    @IBOutlet weak var profile5: UIImageView!
    @IBOutlet weak var profile4: UIImageView!
    @IBOutlet weak var profile3: UIImageView!
    @IBOutlet weak var profile1: UIImageView!
    @IBOutlet weak var profile2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBottomBarWhenPushed = true
        
        bgVIiew.layer.cornerRadius = 8
        profile1.contentMode = .scaleAspectFill
        profile1.layer.cornerRadius = profile1.bounds.width / 2
        profile2.contentMode = .scaleAspectFill
        profile2.layer.cornerRadius = profile1.bounds.width / 2
        profile3.contentMode = .scaleAspectFill
        profile3.layer.cornerRadius = profile1.bounds.width / 2
        profile4.contentMode = .scaleAspectFill
        profile4.layer.cornerRadius = profile1.bounds.width / 2
        profile5.contentMode = .scaleAspectFill
        profile5.layer.cornerRadius = profile1.bounds.width / 2
        profile6.contentMode = .scaleAspectFill
        profile6.layer.cornerRadius = profile1.bounds.width / 2
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

