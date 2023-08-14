//
//  SurveyThirdVC.swift
//  MOS
//
//  Created by 김지은 on 2023/06/07.
//

import Foundation
import UIKit
class SurveyThirdVC: UIViewController {
   
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var exitBtn: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        backBtn.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        backBtn.addGestureRecognizer(tapGesture)
        
        exitBtn.isUserInteractionEnabled = true
        let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(image2Tapped))
        exitBtn.addGestureRecognizer(tap2Gesture)
    }

    @objc func buttonTapped() {
        print(#fileID, #function, #line, "- StartButton clicked")
        self.performSegue(withIdentifier: "navToLastSurvey", sender: self)
        }
    
    
    @objc func imageTapped() {
        print(#fileID, #function, #line, "- backButton clicked")
        self.performSegue(withIdentifier: "back3", sender: self)
        }
    
    @objc func image2Tapped() {
        print(#fileID, #function, #line, "- exitButton clicked")
        self.performSegue(withIdentifier: "Home", sender: self)
        }

}
