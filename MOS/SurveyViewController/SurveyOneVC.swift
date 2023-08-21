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
    @IBOutlet weak var exitBtn: UIImageView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var selectedButton: UIView?
    var buttonToCheckBoxMap: [UIView: UIImageView] = [:]
    var currentQuestionIndex = 0
    let questions = [
            "산업분석을 하기 위해서 산업 보다 기업을 먼저 정해야한다고 생각한다.",
            "산업 / 직무 분석을 하는 방법에 대해 알고 있다.",
            "산업 / 직무에 대한 조사결과를 통해 나의 생각을 막힘없이 말할 수 있다.",
            "직무를 분석하기 위해 현직자를 만나는 것이 중요하다고 생각한다.",
            "직무를 분석하기 위해 현직자를 만난다면 어떤 질문을 준비해야 할지 잘 알고 있다.",
            "사회 전반 주요 이슈에 대한 자신의 생각을 자신있게 말할 수 있다."
        ]
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
        
        updateQuestion()

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
          
          exitBtn.isUserInteractionEnabled = true
          let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(exitBtnTapped))
          exitBtn.addGestureRecognizer(tap2Gesture)
        
        backBtn.isUserInteractionEnabled = true
        let backBtnClick = UITapGestureRecognizer(target: self, action: #selector(backBtnTapped))
        backBtn.addGestureRecognizer(backBtnClick)
        
      }

      @objc func startBtnTapped() {
          print(#fileID, #function, #line, "- StartButton clicked")
          self.performSegue(withIdentifier: "navToSecondSurvey", sender: self)
          }
      
      
      @objc func exitBtnTapped() {
          print(#fileID, #function, #line, "- exitButton clicked")
          self.performSegue(withIdentifier: "Home", sender: self)
          }
    
    @objc func backBtnTapped() {
        if currentQuestionIndex > 0 {
                currentQuestionIndex -= 1
                updateQuestion()

                // Reset the selected button and checkbox for the previous question
                if let selectedButton = selectedButton {
                    toggleButtonColors(selectedButton)
                    buttonToCheckBoxMap[selectedButton]?.image = UIImage(named: "img_survey_checkbox")
                }

                selectedButton = nil
            } else {
                // Perform the segue to the start screen
                self.performSegue(withIdentifier: "navToStart", sender: self)
            }
    }
    
    func updateQuestion() {
            question.text = questions[currentQuestionIndex]
            questionNum.text = "Q \(currentQuestionIndex + 1)/\(questions.count)"
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
                
                if checkBoxImage.image == UIImage(named: "survey_checked") {
                    // Delay the question update to give users a chance to see the selected button
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        // 질문 및 질문 번호 업데이트
                        self.currentQuestionIndex += 1
                        if self.currentQuestionIndex < self.questions.count {
                            self.updateQuestion()
                        } else {
                            // 모든 질문이 끝난 경우 다음 화면으로 이동
                            self.performSegue(withIdentifier: "navToSecondSurvey", sender: self)
                        }
                        
                        // Reset the UI after the question update
                        self.toggleButtonColors(buttonView)
                        self.buttonToCheckBoxMap[buttonView]?.image = UIImage(named: "img_survey_checkbox")
                        self.selectedButton = nil
                    }
                }
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
