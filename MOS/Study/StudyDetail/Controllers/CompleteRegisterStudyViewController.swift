//
//  CompleteRegisterStudyViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class CompleteRegisterStudyViewController: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 8
    }
    
    @IBAction func completeRegisterButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
}
