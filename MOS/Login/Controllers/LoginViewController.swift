//
//  LoginViewController.swift
//  MOS
//
//  Created by yeonsu on 10/18/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var ResultModel: SignInResultModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        
    }
    
    func setStyle() {
        // 텍스트뷰 padding 설정
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailTextField.frame.size.height))
        
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailTextField.frame.size.height))
        
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = .always
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
        
        self.emailTextField.layer.cornerRadius = 8
        self.passwordTextField.layer.cornerRadius = 8
        
        self.emailTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.passwordTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.kakaoLoginButton.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.emailTextField.layer.borderWidth = 1
        self.passwordTextField.layer.borderWidth = 1
        self.kakaoLoginButton.layer.borderWidth = 1
    }
    
    
    // 회원가입 버튼
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        let SignUpView = UIStoryboard(name: "SignUp", bundle: nil)
        guard let SignUpVC = SignUpView.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpViewController else { return }
        navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
    
    // 로그인 버튼
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        let parmeterData = SignInModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        SignInPost.instance.SignInPosting(parameters: parmeterData) { result in self.ResultModel = result }
        
        let accessToken = KeyChain.read(account: "MosAccessToken")
        print("AccessToken read successfully \(accessToken)")
    }
}
 
