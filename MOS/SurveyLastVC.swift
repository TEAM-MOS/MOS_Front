//
//  SurveyLastVC.swift
//  MOS
//
//  Created by 김지은 on 2023/06/07.
//

import Foundation
import UIKit
class SurveyLasttVC: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        print(#fileID, #function, #line, "- StartButton clicked")
        self.performSegue(withIdentifier: "navToHome", sender: self)
        }

}
