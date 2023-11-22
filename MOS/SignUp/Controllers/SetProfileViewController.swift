//
//  SetProfileViewController.swift
//  MOS
//
//  Created by yeonsu on 11/7/23.
//

import UIKit

class SetProfileViewController: UIViewController, SendUpdateDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
       
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var selectStudyTypeButton: UIButton!
    @IBOutlet weak var selectStudyTypeButton2: UIButton!
    
    let imagePickerController = UIImagePickerController()
    let startDatePicker = UIDatePicker()
    let endDatePicker = UIDatePicker()
    
    
    func sendUpdate(studyType: [String]) {
        
        if studyType.isEmpty == false {
            selectStudyTypeButton.setTitle(studyType.first, for: .normal)
            
            if studyType.count == 1 {
                selectStudyTypeButton2.isHidden = true
            } else if studyType.count >= 2 {
                selectStudyTypeButton2.setTitle(studyType[1], for: .normal)
                selectStudyTypeButton2.isHidden = false
            }
        }
    }
    
    func setupDatePicker(datePicker: UIDatePicker, textField: UITextField, placeholder: String, minimumDate: Date? = nil) {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        datePicker.minimumDate = minimumDate
        textField.inputView = datePicker
        textField.placeholder = placeholder
        
        textField.layer.cornerRadius = 8
        
        let datePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: startDateTextField.frame.size.height))
        
        textField.leftView = datePaddingView
        textField.leftViewMode = .always
    }
    
    
    
    @objc func dateChange(_ sender: UIDatePicker) {
        startDateTextField.text = dateFormat(date: sender.date)
        endDatePicker.minimumDate = sender.date
    }
    
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        return formatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboard()
        
        self.navigationController?.navigationBar.isHidden = true
        
        startDateTextField.isUserInteractionEnabled = true
        
        selectStudyTypeButton2.isHidden = true
        
        setTextFieldUI(textField: nicknameTextField)
        setTextFieldUI(textField: goalTextField)
        
        setupDatePicker(datePicker: startDatePicker, textField: startDateTextField, placeholder: "날짜 선택하기")
        
        setupToolBar()
        
       
        
        userProfileImage.layer.cornerRadius = self.userProfileImage.frame.size.height / 2
        userProfileImage.layer.masksToBounds = true
        userProfileImage.clipsToBounds = true
        
        self.imagePickerController.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectType" {
            guard let studyTypeVC: StudyTypeViewController = segue.destination as? StudyTypeViewController else { return }
            studyTypeVC.delegate = self
        }
    }
    
    func setTextFieldStyle() {
        self.nicknameTextField.layer.cornerRadius = 8
        self.goalTextField.layer.cornerRadius = 8
        self.startDateTextField.layer.cornerRadius = 8
        
        self.nicknameTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.goalTextField.layer.borderColor = UIColor.systemGray6.cgColor
        self.startDateTextField.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.nicknameTextField.layer.borderWidth = 1
        self.goalTextField.layer.borderWidth = 1
        self.startDateTextField.layer.borderWidth = 1
        
        // 텍스트뷰 padding 설정
        let nicknamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: nicknameTextField.frame.size.height))
        
        let goalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: goalTextField.frame.size.height))
        
        let datePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: startDateTextField.frame.size.height))
        
        nicknameTextField.leftView = nicknamePaddingView
        nicknameTextField.leftViewMode = .always
        goalTextField.leftView = goalPaddingView
        goalTextField.leftViewMode = .always
        startDateTextField.leftView = datePaddingView
        startDateTextField.leftViewMode = .always
    }
    
    func hideKeyboard() {
        
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
        
        
        startDateTextField.resignFirstResponder()

    }
    
    @IBAction func studyTypeButtonDidTapped(_ sender: Any) {
    }
    
    
    @IBAction func finishButtonDidTapped(_ sender: Any) {
        if !(self.nicknameTextField.text?.isEmpty ?? true) && !(self.goalTextField.text?.isEmpty ?? true) {
            guard let CompleteVC = storyboard?.instantiateViewController(withIdentifier: "CompleteSignUp") as? CompleteSignUpViewController else { return }
            navigationController?.pushViewController(CompleteVC, animated: false)
        }
    }
    
    @IBAction func UploadImageButton(_ sender: Any) {
        self.imagePickerController.delegate = self
               self.imagePickerController.sourceType = .photoLibrary
               present(self.imagePickerController, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userProfileImage?.image = image
            userProfileImage.contentMode = .scaleAspectFill
            }
        
        
        picker.dismiss(animated: false, completion: nil) //dismiss를 직접 해야함
    }
}

extension UITextField {
    // 왼쪽에 여백 주기
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // 오른쪽에 여백 주기
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
