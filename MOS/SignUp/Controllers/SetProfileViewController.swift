//
//  SetProfileViewController.swift
//  MOS
//
//  Created by yeonsu on 11/7/23.
//

import UIKit

class SetProfileViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    func setTextFieldStyle() {
        self.nicknameTextField.layer.cornerRadius = 8
        self.goalTextField.layer.cornerRadius = 8
        self.startDateTextField.layer.cornerRadius = 8
        self.endDateTextField.layer.cornerRadius = 8
        
        self.nicknameTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.goalTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.startDateTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.endDateTextField.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.nicknameTextField.layer.borderWidth = 1
        self.goalTextField.layer.borderWidth = 1
        self.startDateTextField.layer.borderWidth = 1
        self.endDateTextField.layer.borderWidth = 1
        
        // 텍스트뷰 padding 설정
        let nicknamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: nicknameTextField.frame.size.height))
        
        let goalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: goalTextField.frame.size.height))
        
        nicknameTextField.leftView = nicknamePaddingView
        nicknameTextField.leftViewMode = .always
        goalTextField.leftView = goalPaddingView
        goalTextField.leftViewMode = .always
    }
    
    @IBAction func finishButtonDidTapped(_ sender: Any) {
        if !(self.nicknameTextField.text?.isEmpty ?? true) && !(self.goalTextField.text?.isEmpty ?? true) {
            guard let CompleteVC = storyboard?.instantiateViewController(withIdentifier: "CompleteSignUp") as? CompleteSignUpViewController else { return }
            navigationController?.pushViewController(CompleteVC, animated: false)
        }
    }
    
    
}
