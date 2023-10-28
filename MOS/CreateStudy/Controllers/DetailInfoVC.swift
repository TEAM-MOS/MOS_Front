//
//  DetailInfoVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/25.
//

import UIKit

class DetailInfoVC: UIViewController, UITextViewDelegate {
    
    var rulePopUp: RulePopUp!
    var introPopUp: IntroPopUp!
    
    //이전 화면에서 받아온 값
    var selectedCategory: Int?
    var studyTitleText: String?
    var studyMood: String?
    var postStartDate: String?
    var postEndDate: String?
    var maxMemberCount: Int = 4
    var isOnline: Bool = false
    var place: String?
    var onlinePlatform: Int?

    @IBOutlet weak var popUpView2: UIButton!
    @IBOutlet weak var popUpView1: UIButton!
    @IBOutlet weak var sunLabel: UILabel!
    @IBOutlet weak var satLabel: UILabel!
    @IBOutlet weak var FriLabel: UILabel!
    @IBOutlet weak var thursLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    @IBOutlet weak var TueLabel: UILabel!
    @IBOutlet weak var MonLabel: UILabel!
    @IBOutlet weak var sunView: UIView!
    @IBOutlet weak var satView: UIView!
    @IBOutlet weak var friView: UIView!
    @IBOutlet weak var thursView: UIView!
    @IBOutlet weak var wedView: UIView!
    @IBOutlet weak var TueView: UIView!
    @IBOutlet weak var MonView: UIView!
    @IBOutlet weak var studyRuleTextField: UITextView!
    @IBOutlet weak var studyIntroduceTextView: UITextView!
    
    @IBOutlet weak var questionTextView: UITextView!
    // Dictionary to store the tap count for each view
    var tapCount: [UIView: Int] = [:]
    
    // Array to store selected days
    var studyDayEntities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그로 변수들의 값 확인
        print("selectedCategory: \(selectedCategory ?? -1)")
        print("studyTitleText: \(studyTitleText ?? "N/A")")
        print("studyMood: \(studyMood ?? "N/A")")
        print("postStartDate: \(postStartDate ?? "N/A")")
        print("postEndDate: \(postEndDate ?? "N/A")")
        print("maxMemberCount: \(maxMemberCount)")
        print("isOnline: \(isOnline)")
        print("place: \(place ?? "N/A")")
        print("onlinePlatFormNum: \(onlinePlatform ?? -1)")
        
        popUpView1.layer.cornerRadius = 4
        popUpView2.layer.cornerRadius = 4
        
        studyRuleTextField.layer.cornerRadius = 8
        studyRuleTextField.layer.borderColor = UIColor(hex: "F2F2F2").cgColor
        studyRuleTextField.layer.backgroundColor = UIColor(hex: "F2F2F2").cgColor
        studyRuleTextField.layer.borderWidth = 1
        studyRuleTextField.delegate = self
        studyRuleTextField.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        studyIntroduceTextView.layer.cornerRadius = 8
        studyIntroduceTextView.layer.borderColor = UIColor(hex: "F2F2F2").cgColor
        studyIntroduceTextView.layer.backgroundColor = UIColor(hex: "F2F2F2").cgColor
        studyIntroduceTextView.layer.borderWidth = 1
        studyIntroduceTextView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        questionTextView.layer.cornerRadius = 8
        questionTextView.layer.borderColor = UIColor(hex: "F2F2F2").cgColor
        questionTextView.layer.backgroundColor = UIColor(hex: "F2F2F2").cgColor
        questionTextView.layer.borderWidth = 1
        questionTextView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        setupWeekView(sunView)
        setupWeekView(satView)
        setupWeekView(friView)
        setupWeekView(thursView)
        setupWeekView(wedView)
        setupWeekView(TueView)
        setupWeekView(MonView)
        
        
        // Add tap gesture recognizers to views
        addTapGestureToView(sunView, day: "SUN")
        addTapGestureToView(satView, day: "SAT")
        addTapGestureToView(friView, day: "FRI")
        addTapGestureToView(thursView, day: "THURS")
        addTapGestureToView(wedView, day: "WED")
        addTapGestureToView(TueView, day: "TUE")
        addTapGestureToView(MonView, day: "MON")
    }
    
    func setupRuleView(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        view.layer.backgroundColor = UIColor(hex: "FFE7E7").cgColor
        view.layer.borderColor = UIColor(hex: "FF5454").cgColor
        
        // Initialize the tap count for each view to 0
        tapCount[view] = 0
    }

    func setupWeekView(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
        
        // Initialize the tap count for each view to 0
        tapCount[view] = 0
    }
    
    func addTapGestureToView(_ view: UIView, day: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        
        // Store the corresponding day when adding the gesture recognizer
        view.accessibilityIdentifier = day
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        if let view = gesture.view, let day = view.accessibilityIdentifier {
            if let count = tapCount[view] {
                if count % 2 == 0 {
                    // On even taps, change the colors
                    view.backgroundColor = UIColor(hex: "FF5454")
                    view.layer.borderColor = UIColor(hex: "FECFC4").cgColor
                    // Change the label text color to white
                    changeLabelTextColor(labelForView(view), color: .white)
                    // Add the day to studyDayEntities
                    studyDayEntities.append(day)
                } else {
                    // On odd taps, revert to the original colors
                    view.backgroundColor = UIColor(hex: "FFFFFF")
                    view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
                    // Change the label text color to black
                    changeLabelTextColor(labelForView(view), color: .black)
                    // Remove the day from studyDayEntities
                    if let index = studyDayEntities.firstIndex(of: day) {
                        studyDayEntities.remove(at: index)
                    }
                }
                // Increment the tap count for the view
                tapCount[view] = count + 1
            }
        }
    }
    
    func changeLabelTextColor(_ label: UILabel?, color: UIColor) {
        label?.textColor = color
    }
    
    func labelForView(_ view: UIView) -> UILabel? {
        // Map views to labels as per your naming convention
        switch view {
        case sunView: return sunLabel
        case satView: return satLabel
        case friView: return FriLabel
        case thursView: return thursLabel
        case wedView: return wedLabel
        case TueView: return TueLabel
        case MonView: return MonLabel
        default: return nil
        }
    }
    
    @IBAction func ruleBtnClicked(_ sender: Any){
        self.rulePopUp = RulePopUp(frame: self.view.frame)
        self.rulePopUp.closeBtn.addTarget(self, action: #selector(closeBtnTapped), for:.touchUpInside)
        self.view.addSubview(rulePopUp)
    }
    
    @objc func closeBtnTapped(){
        self.rulePopUp.removeFromSuperview()
        updateStudyRuleTextField()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        guard let navigationControllers = self.navigationController?.viewControllers else { return }
        for viewController in navigationControllers {
            if let previousVC = viewController as? BasicInfoVC {
                self.navigationController?.popToViewController(previousVC, animated: false)
                break
            }
        }
    }
    
    @IBAction func inroBtnClicked(_ sender: Any){
        self.introPopUp = IntroPopUp(frame: self.view.frame)
        self.introPopUp.introPopUpCloseBtn.addTarget(self, action: #selector(closeinroBtnTapped), for:.touchUpInside)
        self.view.addSubview(introPopUp)
    }
    
    @objc func closeinroBtnTapped(){
        self.introPopUp.removeFromSuperview()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // 사용자가 엔터 키를 눌렀을 때
            textView.insertText("\n🌟 ")
            return false
        }
        return true
    }
    
    func updateStudyRuleTextField() {
        let ruleTexts: [String] = rulePopUp.selectedViews.map { view in
               switch view.tag {
               case 0:
                   return "🌟 서로를 존중하고 매너있게 대화를 나눠요."
               case 1:
                   return "🌟 지각시, 지각비를 내야해요."
               case 2:
                   return "🌟 연애나 친목을 금지해요."
               case 3:
                   return "🌟 스터디에 발표 시, 열심히 준비하신 분은 투표를 통해 당일 모임비에서 제외시켜드려요."
               case 4:
                   return "🌟 스터디 과제 꼭 해오기. 안해올 경우, 패널티 부여."
               case 5:
                   return "🌟 스터디 당일 연락두절 되지 않기."
               default:
                   return ""
               }
           }
           studyRuleTextField.text = ruleTexts.joined(separator: "\n")
       }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if let registerTodoVC = storyboard?.instantiateViewController(withIdentifier: "RegisterTodoVC") as? RegisterTodoVC {
                // 변수들을 다음 뷰 컨트롤러에 전달
            registerTodoVC.selectedCategory = selectedCategory
            registerTodoVC.studyTitleText = studyTitleText
            registerTodoVC.studyMood = studyMood
            registerTodoVC.postStartDate = postStartDate
            registerTodoVC.postEndDate = postEndDate
            registerTodoVC.maxMemberCount = maxMemberCount
            registerTodoVC.isOnline = isOnline
            registerTodoVC.place = place
            registerTodoVC.onlinePlatform = onlinePlatform

            self.navigationController?.pushViewController(registerTodoVC, animated: false)
        }
    }
    
    

}



