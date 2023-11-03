//
//  SignUpViewController.swift
//  MOS
//
//  Created by yeonsu on 10/12/23.
//

import UIKit

@available(iOS 15.0, *)
class SignUpViewController: UIViewController, UITextFieldDelegate, PopUpDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var ResultModel: SignUpResultModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTargetToTextField()
        setTextFieldStyle()
    }
    
    // 비밀번호, 비밀번호 확인 텍스트가 같은지 확인
    func isSameBothTextField(_ first: UITextField,_ second: UITextField) -> Bool {
        
        if(first.text == second.text) {
            return true
        } else {
            return false
        }
    }
    
    @objc func TextFieldDidChanged(_ sender: UITextField) {
        
        print("텍스트 변경 감지")
        print("text :", sender.text)
        
        //3개 텍스트필드가 채워졌는지, 비밀번호가 일치하는지 확인.
        if !(self.emailTextField.text?.isEmpty ?? true)
            && !(self.passwordTextField.text?.isEmpty ?? true)
            && isSameBothTextField(passwordTextField, checkPasswordTextField) && isValidEmail(emailTextField.text ?? "") && isValidPassword(passwordTextField.text ?? "") {
            updateNextButton(willActive: true)
        }
        else {
            updateNextButton(willActive: false)
            self.signUpButton.tintColor = UIColor(named: "gray-2    ")
            self.signUpButton.configuration?.background.backgroundColor = UIColor(named: "inactive_button_bg")
        }
    }
    
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        
        var tempEmailText = self.emailTextField.text
        print(tempEmailText)
        
        if textField == emailTextField {
            if isValidEmail(tempEmailText ?? "") == false {
                self.emailTextField.layer.borderColor = UIColor.red.cgColor
                self.emailTextField.layer.borderWidth = 1
            } else {
                self.emailTextField.layer.borderColor = UIColor.systemGray6.cgColor
                self.emailTextField.layer.borderWidth = 1
            }
        }
        
        
        var tempPasswordText = self.passwordTextField.text
        
        if textField == passwordTextField {
            if isValidPassword(tempPasswordText ?? "") == false {
                self.passwordTextField.layer.borderColor = UIColor.red.cgColor
                self.passwordTextField.layer.borderWidth = 1
            } else {
                self.passwordTextField.layer.borderColor = UIColor.systemGray6.cgColor
                self.passwordTextField.layer.borderWidth = 1
            }
        }
        
        if textField == checkPasswordTextField {
            if isSameBothTextField(passwordTextField, checkPasswordTextField) == false {
                self.checkPasswordTextField.layer.borderColor = UIColor.red.cgColor
                self.checkPasswordTextField.layer.borderWidth = 1
            } else {
                self.checkPasswordTextField.layer.borderColor = UIColor.systemGray6.cgColor
                self.checkPasswordTextField.layer.borderWidth = 1
            }
            
            if isValidPassword(tempPasswordText ?? "") == false {
                self.checkPasswordTextField.layer.borderColor = UIColor.red.cgColor
                self.checkPasswordTextField.layer.borderWidth = 1
            } else {
                self.checkPasswordTextField.layer.borderColor = UIColor.systemGray6.cgColor
                self.checkPasswordTextField.layer.borderWidth = 1
            }
            
            
            
        }
        
    }
    
    func setTextFieldStyle() {
        self.emailTextField.layer.cornerRadius = 8
        self.passwordTextField.layer.cornerRadius = 8
        self.checkPasswordTextField.layer.cornerRadius = 8
        
        self.emailTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.passwordTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.checkPasswordTextField.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.emailTextField.layer.borderWidth = 1
        self.passwordTextField.layer.borderWidth = 1
        self.checkPasswordTextField.layer.borderWidth = 1
        
        // 텍스트뷰 padding 설정
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailTextField.frame.size.height))
        
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailTextField.frame.size.height))
        
        let checkPasswordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailTextField.frame.size.height))
        
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = .always
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
        checkPasswordTextField.leftView = checkPasswordPaddingView
        checkPasswordTextField.leftViewMode = .always
    }
    
    
    @available(iOS 15.0, *)
    func updateNextButton(willActive: Bool) {
        if(willActive == true) {
            //다음 버튼 색 변경
            self.signUpButton.tintColor = .white
            self.signUpButton.configuration?.background.backgroundColor = UIColor(named: "main")
            //다음 페이지 연결
            print("다음 버튼 활성화")
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{10,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func setAddTargetToTextField() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.checkPasswordTextField.delegate = self
        
        self.emailTextField.addTarget(self, action: #selector(self.TextFieldDidChanged(_:)), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.TextFieldDidChanged(_:)), for: .editingChanged)
        self.checkPasswordTextField.addTarget(self, action: #selector(self.TextFieldDidChanged(_:)), for: .editingChanged)
    }
    
    
    func handleAction(action: Bool) {
        if (action) {
            // API post
          }
       }
    
    
    @IBAction func emailConfirmButtonDidTapped(_ sender: Any) {
        PopUpActionViewController.showPopup(parentVC: self)
    }
    

    @IBAction func signUpPost(_ sender: Any) {
        // API post
        let parmeterData = SignUpModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")

        print(parmeterData)

        SignUpPost.instance.SignUpPosting(parameters: parmeterData) { result in self.ResultModel = result }

        print("회원가입 성공!")
    }
}
