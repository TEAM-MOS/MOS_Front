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
    
    let startDatePicker = UIDatePicker()
    let endDatePicker = UIDatePicker()
    
    func setupDatePicker(datePicker: UIDatePicker, textField: UITextField, placeholder: String, minimumDate: Date? = nil) {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        datePicker.minimumDate = minimumDate
        textField.inputView = datePicker
        textField.placeholder = placeholder
        
        textField.layer.cornerRadius = 8
    }



    
    @objc func dateChange(_ sender: UIDatePicker) {
        startDateTextField.text = dateFormat(date: sender.date)
        endDateTextField.text = dateFormat(date: sender.date)
        endDatePicker.minimumDate = sender.date
    }

    
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy / MM / dd"
        
        return formatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        startDateTextField.isUserInteractionEnabled = true
        endDateTextField.isUserInteractionEnabled = true
        
        setTextFieldUI(textField: nicknameTextField)
        setTextFieldUI(textField: goalTextField)
        
        setupDatePicker(datePicker: startDatePicker, textField: startDateTextField, placeholder: "시작 날짜")
        setupDatePicker(datePicker: endDatePicker, textField: endDateTextField, placeholder: "종료 날짜", minimumDate: startDatePicker.date)

        setupToolBar()
        
        dismissKeyboard()
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
    
    func dismisskeyboard() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    private func setupToolBar() {
        
        let toolBar = UIToolbar()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandeler))
        
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        
        startDateTextField.inputAccessoryView = toolBar
        endDateTextField.inputAccessoryView = toolBar
    }
    
    private func setTextFieldUI(textField: UITextField) {
        textField.layer.cornerRadius = 8

        textField.layer.borderColor = UIColor.systemGray6.cgColor
        
        textField.layer.borderWidth = 1
        
        // 텍스트뷰 padding 설정
        let PaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.size.height))
        
        textField.leftView = PaddingView
        textField.leftViewMode = .always
        
        
    }
    
    @objc func doneButtonHandeler(_ sender: UIBarButtonItem) {
        
        startDateTextField.text = dateFormat(date: startDatePicker.date)
        
        endDateTextField.text = dateFormat(date: endDatePicker.date)
        
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
    }
    
    @IBAction func studyTypeButtonDidTapped(_ sender: Any) {
    }
    
    
    @IBAction func finishButtonDidTapped(_ sender: Any) {
        if !(self.nicknameTextField.text?.isEmpty ?? true) && !(self.goalTextField.text?.isEmpty ?? true) {
            guard let CompleteVC = storyboard?.instantiateViewController(withIdentifier: "CompleteSignUp") as? CompleteSignUpViewController else { return }
            navigationController?.pushViewController(CompleteVC, animated: false)
        }
    }
    
    
}
