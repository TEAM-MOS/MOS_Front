//
//  SurveyInterviewViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/05/21.
//

import Foundation
import UIKit
class SurveyOneVC: UIViewController {
   
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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitBtn: UIImageView!
    @IBOutlet weak var backBtn: UIImageView!
    
    var selectedButton: UIView?
    var buttonToCheckBoxMap: [UIView: UIImageView] = [:]
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.

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
          
          backBtn.isUserInteractionEnabled = true
          let tapBackBtn = UITapGestureRecognizer(target: self, action: #selector(backBtnTapped))
          backBtn.addGestureRecognizer(tapBackBtn)
          
          exitBtn.isUserInteractionEnabled = true
          let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(exitBtnTapped))
          exitBtn.addGestureRecognizer(tap2Gesture)
      }

      @objc func startBtnTapped() {
          print(#fileID, #function, #line, "- StartButton clicked")
          self.performSegue(withIdentifier: "navToSecondSurvey", sender: self)
          }
      
      @objc func backBtnTapped() {
          print(#fileID, #function, #line, "- backButton clicked")
          self.performSegue(withIdentifier: "back1", sender: self)
          }
      
      @objc func exitBtnTapped() {
          print(#fileID, #function, #line, "- exitButton clicked")
          self.performSegue(withIdentifier: "Home", sender: self)
          }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
            if let buttonView = sender.view {
                if buttonView == selectedButton {
                    // 같은 버튼을 두 번 클릭한 경우 선택 해제
                    toggleButtonColors(buttonView)
                    selectedButton = nil
                } else {
                    // 다른 버튼을 클릭한 경우
                    toggleButtonColors(buttonView)
                    if let selectedButton = selectedButton {
                        toggleButtonColors(selectedButton)
                    }
                    selectedButton = buttonView
                }
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
            if checkBoxImage.image == UIImage(named: "image_survey_checkbox") {
                checkBoxImage.image = UIImage(named: "survey_checked")
                // 다른 체크박스 이미지를 원래 이미지로 돌려놓기
                for (_, checkBox) in buttonToCheckBoxMap {
                    if checkBox != checkBoxImage {
                        checkBox.image = UIImage(named: "image_survey_checkbox")
                    }
                }
            } else {
                checkBoxImage.image = UIImage(named: "survey_checked")
            }
        }

  }
