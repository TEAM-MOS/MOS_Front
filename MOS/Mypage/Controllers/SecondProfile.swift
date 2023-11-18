//
//  MypageVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/19.
//

import Foundation
import UIKit
class SecondProfile :UIViewController{
    
    @IBOutlet weak var approvalBtn: UIButton!
    @IBOutlet weak var refuseBtn: UIButton!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.bounds.width / 2
        
        view1.backgroundColor = UIColor(hex: "F9F9F9")
        view1.layer.cornerRadius = 8
        view2.backgroundColor = UIColor(hex: "F9F9F9")
        view2.layer.cornerRadius = 8
        view3.backgroundColor = UIColor(hex: "FFE7E7")
        view3.layer.cornerRadius = 10
        view4.backgroundColor = UIColor(hex: "FFE7E7")
        view4.layer.cornerRadius = 10
        
        approvalBtn.layer.cornerRadius = 8
        refuseBtn.layer.cornerRadius = 8
        
    }
    @IBAction func admit(_ sender: Any) {
        if let myStudyVC = storyboard?.instantiateViewController(withIdentifier: "Mystudy2VC") as? Mystudy2VC {
            navigationController?.pushViewController(myStudyVC, animated: false)
        }
    }
}
