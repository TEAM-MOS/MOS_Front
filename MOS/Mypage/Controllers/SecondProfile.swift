//
//  MypageVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/19.
//

import Foundation
import UIKit
class SecondProfile :UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func admit(_ sender: Any) {
        if let myStudyVC = storyboard?.instantiateViewController(withIdentifier: "Mystudy2VC") as? Mystudy2VC {
            navigationController?.pushViewController(myStudyVC, animated: false)
        }
    }
}
