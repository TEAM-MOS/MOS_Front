//
//  SurveyInterviewViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/05/21.
//

import Foundation
import UIKit
class SurveyFirstVC: UIViewController {
   
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        print(#fileID, #function, #line, "- StartButton clicked")
        self.performSegue(withIdentifier: "navToSecondSurvey", sender: self)
        }

}
