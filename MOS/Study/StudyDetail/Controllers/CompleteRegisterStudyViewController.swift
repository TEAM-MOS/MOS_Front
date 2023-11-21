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
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "studyDetailVC") as? StudyDetailViewController else { return }
        nextVC.modalPresentationStyle = .overCurrentContext
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
