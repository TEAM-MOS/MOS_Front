//
//  PreQuestionAlertViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/21.
//

import UIKit

class PreQuestionAlertViewController: UIViewController {
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var popUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        let cornerRadius: CGFloat = 10

             // noBtn 오른쪽 아래의 모서리만 둥글게 처리
             let noBtnMaskLayer = CAShapeLayer()
             noBtnMaskLayer.path = UIBezierPath(roundedRect: noBtn.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
             noBtn.layer.mask = noBtnMaskLayer

             // yesBtn 왼쪽 아래의 모서리만 둥글게 처리
             let yesBtnMaskLayer = CAShapeLayer()
             yesBtnMaskLayer.path = UIBezierPath(roundedRect: yesBtn.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
             yesBtn.layer.mask = yesBtnMaskLayer
        
        
    }
    @IBAction func noButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        // 네 버튼 클릭 시 화면 이동
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StudyRegisterVC") as? StudyRegisterViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false, completion: nil)
        
    }
    
    
}
