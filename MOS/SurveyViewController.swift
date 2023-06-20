//
//  SurveyViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/05/19.
//

import Foundation
import UIKit
class SurveyViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var skipBtn: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.hidesBottomBarWhenPushed = true
        
        self.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        skipBtn.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(skipBtnTapped))
        skipBtn.addGestureRecognizer(tapGesture)
    }

    @objc func buttonTapped() {
        print(#fileID, #function, #line, "- StartButton clicked")
        self.performSegue(withIdentifier: "navToFirstSurvey", sender: self)
        }
    
    @objc func skipBtnTapped() {
        self.performSegue(withIdentifier: "Home", sender: self)
        }

}
