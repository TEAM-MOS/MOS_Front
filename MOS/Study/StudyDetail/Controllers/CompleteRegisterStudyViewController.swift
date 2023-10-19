//
//  CompleteRegisterStudyViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class CompleteRegisterStudyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func completeRegisterButtonTapped(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "studyDetailVC") as? StudyDetailViewController else { return }
        nextVC.modalPresentationStyle = .overCurrentContext
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
