//
//  SurveyInputView.swift
//  MOS
//
//  Created by 김지은 on 2023/05/21.
//

import Foundation
import UIKit

@IBDesignable
class SurveyInputView: UIView {
    
    @IBOutlet weak var checkBoxOne: UIImageView!
    @IBOutlet weak var checkBoxTwo: UIImageView!
    @IBOutlet weak var checkBoxThree: UIImageView!
    @IBOutlet weak var checkBoxFour: UIImageView!
    @IBOutlet weak var checkBoxFive: UIImageView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var btnOne: UIView!
    @IBOutlet weak var btnTwo: UIView!
    @IBOutlet weak var btnThree: UIView!
    @IBOutlet weak var btnFour: UIView!
    @IBOutlet weak var btnFive: UIView!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var selectedButton: UIView?
    var buttonToCheckBoxMap: [UIView: UIImageView] = [:]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButtonView(btnOne)
        configureButtonView(btnTwo)
        configureButtonView(btnThree)
        configureButtonView(btnFour)
        configureButtonView(btnFive)
        configureCategoryView()
        
        buttonToCheckBoxMap[btnOne] = checkBoxOne
        buttonToCheckBoxMap[btnTwo] = checkBoxTwo
        buttonToCheckBoxMap[btnThree] = checkBoxThree
        buttonToCheckBoxMap[btnFour] = checkBoxFour
        buttonToCheckBoxMap[btnFive] = checkBoxFive
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
                btnOne.addGestureRecognizer(tapGesture)
                
                let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
                btnTwo.addGestureRecognizer(tapGesture2)
                
                let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
                btnThree.addGestureRecognizer(tapGesture3)
                
                let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
                btnFour.addGestureRecognizer(tapGesture4)
                
                let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
                btnFive.addGestureRecognizer(tapGesture5)
          
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyNib()
    }
    
    fileprivate func applyNib() {
        let nibName = String(describing: Self.self)
        let nib = Bundle.main.loadNibNamed(nibName, owner: self)
        guard let view = nib?.first as? UIView else {
            return
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
  
  @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
      if let buttonView = sender.view {
          if buttonView == selectedButton {
              // 이미 선택된 버튼을 다시 클릭한 경우 아무 작업도 수행하지 않습니다.
              return
          }
          
          toggleButtonColors(buttonView)
          
          if let selectedButton = selectedButton {
              toggleButtonColors(selectedButton)
          }
          
          selectedButton = buttonView
          
          if let checkBoxImage = buttonToCheckBoxMap[buttonView] {
              toggleCheckBoxImage(checkBoxImage)
          }
      }
  }
  
  func configureButtonView(_ buttonView: UIView) {
          buttonView.layer.cornerRadius = 8
          buttonView.layer.borderWidth = 1
          buttonView.layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1.0).cgColor // EDEDED
          buttonView.backgroundColor = .clear
      }
  
  func configureCategoryView() {
          categoryView.layer.cornerRadius = 8
          categoryView.layer.borderWidth = 1
          categoryView.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1.0).cgColor // EEEEEE
          categoryView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1.0) // F6F6F6
      }
  
  func toggleButtonColors(_ buttonView: UIView) {
          if buttonView.layer.borderColor == UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1.0).cgColor {
              buttonView.layer.borderColor = UIColor(red: 1.0, green: 0.898, blue: 0.870, alpha: 1.0).cgColor // FFE5DE
              buttonView.backgroundColor = UIColor(red: 1.0, green: 0.953, blue: 0.941, alpha: 1.0) // FFF3F0
          } else {
              buttonView.layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1.0).cgColor // EDEDED
              buttonView.backgroundColor = .clear
          }
      }
  
  func toggleCheckBoxImage(_ checkBoxImage: UIImageView) {
          if checkBoxImage.image == UIImage(named: "survey_checked") {
              // 이미 선택된 경우는 아무런 작업을 수행하지 않습니다.
              return
          }
          
          // 모든 체크박스 이미지를 초기화
          for (_, checkBox) in buttonToCheckBoxMap {
              checkBox.image = UIImage(named: "img_survey_checkbox")
          }
          
          // 선택된 체크박스 이미지 변경
          checkBoxImage.image = UIImage(named: "survey_checked")
      }
}
