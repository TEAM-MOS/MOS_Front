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
    var scores: [Int] = Array(repeating: 0, count: 20)
    var buttonToScoreMap: [UIView: Int] = [:]
    let questions = [
            "산업분석을 하기 위해서 산업 보다 기업을 먼저 정해야한다고 생각한다.",
            "산업 / 직무 분석을 하는 방법에 대해 알고 있다.",
            "산업 / 직무에 대한 조사결과를 통해 나의 생각을 막힘없이 말할 수 있다.",
            "직무를 분석하기 위해 현직자를 만나는 것이 중요하다고 생각한다.",
            "직무를 분석하기 위해 현직자를 만난다면 어떤 질문을 준비해야 할지 잘 알고 있다.",
            "사회 전반 주요 이슈에 대한 자신의 생각을 자신있게 말할 수 있다.",
            "사회 전반 주요 이슈와 관련해 스스로 어느 정도의 사고력을 갖추고 있다고 생각한다.",
            "평소 정치 / 경제 / 사회 / 문화 / 과학에 관련된 뉴스를 자주 찾아본다.",
            "시사 이슈가 나의 전공과 업무에 어떻게 연관이 되는지, 혹은 어떤 비전을 갖는지 묻는 질문에 대답을 할 수 있다.",
            "실제 면접에서 시사문제를 어떻게 다루는지 알고 있다.",
            "성장과정을 통해 본인의 가치관이나 성격이 지원한 직무에 적합한지 표현할 수 있다.",
            "자신이 지원하는 기업이나 기관의 인재상, 직무수행에 필요한 능력과 자질 등을 파악했다.",
            "회사의 요구조건과 맞는 자신의 실적이나 경험을 자기소개서에 녹여낼 수 있다.",
            "조직생활에서 자신이 맡았던 역할의 경험을 작성할 수 있다.",
            "회사 업무와 삶에 대한 자신의 장기적인 목표의식과 비전을 명확하게 알고 있다.",
            "입사 지원이유에 대해 묻는다면 기본적인 답변 전략이 있다.",
            "지원하는 직종에 대해 얼마나 잘 알고 있는 질문에 답변할 수 있다.",
            "자신의 조직생활에 있어서 장단점을 묻는 질문에 답변할 수 있다.",
            "직무와 관련되어 위기상황을 극복한 경험을 묻는 질문에 답변할 수 있다.",
            "새로이 입사할 조직문화에 대한 적응방법을 묻는 질문에 답변할 수 있다."
        ]
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
        
        buttonToScoreMap[btnOne] = 0
        buttonToScoreMap[btnTwo] = 1
        buttonToScoreMap[btnThree] = 2
        buttonToScoreMap[btnFour] = 3
        buttonToScoreMap[btnFive] = 4

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
        if let buttonView = sender.view, let score = buttonToScoreMap[buttonView] {
            scores[currentQuestionIndex] = score// 해당 버튼에 대한 점수를 배열에 저장
            print("Scores:", scores)

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
