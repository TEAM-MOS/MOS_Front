//
//  PreQuestionAlertViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class PreQuestionAlertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        // 네 버튼 클릭 시 화면 이동
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StudyRegisterVC") as? StudyRegisterViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    
}
