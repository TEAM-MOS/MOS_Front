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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.layer.masksToBounds = true
        self.startButton.layer.cornerRadius = 10
        
        self.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
            print(#fileID, #function, #line, "- StartButton clicked")
//            let secondViewController = SurveyInterviewViewController()
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "surveyInterviewVC") as? SurveyInterviewViewController else { return }
            navigationController?.pushViewController(nextVC, animated: true)
        }

}
