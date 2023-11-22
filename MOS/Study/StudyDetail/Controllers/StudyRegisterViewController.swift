//
//  StudyRegisterViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class StudyRegisterViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    var placeholderLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.layer.cornerRadius = 8
        textView.delegate = self
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 16
        placeholderLabel = UILabel()
        placeholderLabel.text = "내용을 입력해주세요"
        placeholderLabel.font = .italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.topAnchor.constraint(equalTo:
                                                textView.topAnchor, constant: 18.0).isActive = true
        placeholderLabel.leftAnchor.constraint(equalTo:
                                                textView.leftAnchor, constant: 18.0).isActive = true
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.isHidden = !textView.text.isEmpty
        textView.textContainerInset = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true) /// 화면을 누르면 키보드 내려가게 하는 것
        }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteRegisterStudyVC") as? CompleteRegisterStudyViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false, completion: nil)
    }
    
    
}
extension StudyRegisterViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = true
    }
    
}
