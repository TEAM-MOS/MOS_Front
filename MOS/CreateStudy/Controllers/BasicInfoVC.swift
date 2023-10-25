//
//  BasicInfoVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/19.
//

import Foundation
import UIKit
import DatePicker

class BasicInfoVC: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var studyTitle: UITextField!
    @IBOutlet weak var firstMood: UIView!
    @IBOutlet weak var secondMood: UIView!
    @IBOutlet weak var thirdMood: UIView!
    @IBOutlet weak var firstMoodCheckBox: UIImageView!
    @IBOutlet weak var secondMoodCheckBox: UIImageView!
    @IBOutlet weak var thirdMoodCheckBox: UIImageView!
    
    @IBOutlet weak var MaxMemberNum: UILabel!
    @IBOutlet weak var memberCountUp: UIButton!
    @IBOutlet weak var memberCountDown: UIButton!
    
    @IBOutlet weak var startDate: UIButton!
    @IBOutlet weak var endDate: UIButton!
    // 스터디명 저장 변수
    @IBOutlet weak var placeSegment: UISegmentedControl!
    @IBOutlet weak var placeTextField: UITextField!
    
    //카테고리 번호를 받아오는 변수
    var selectedCategory: Int?
    var studyTitleText: String?
    // 추구하는 스터디 분위기 저장 변수
    var studyMood: String?
    // 진행기간 저장 변수
    var postStartDate: String?
    var postEndDate: String?
    
    // MaxMemberNum 변수
    var maxMemberCount: Int = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let category = selectedCategory {
                    print("선택한 카테고리 번호: \(category)")
                    // 여기에 선택한 카테고리와 관련된 작업을 수행
                }
        
        startDate.layer.cornerRadius = 8
        startDate.layer.borderColor = UIColor(hex: "E8E8E8").cgColor
        startDate.layer.borderWidth = 1
        endDate.layer.cornerRadius = 8
        endDate.layer.borderColor = UIColor(hex: "E8E8E8").cgColor
        endDate.layer.borderWidth = 1
        
        // 추구하는 스터디 분위기 버튼 스타일 설정
        setupView(firstMood, with: firstMoodCheckBox)
        setupView(secondMood, with: secondMoodCheckBox)
        setupView(thirdMood, with: thirdMoodCheckBox)
        
        // 각 뷰에 탭 제스처 추가
        addTapGesture(to: firstMood, with: firstMoodCheckBox, mood: "빡공모드")
        addTapGesture(to: secondMood, with: secondMoodCheckBox, mood: "성실모드")
        addTapGesture(to: thirdMood, with: thirdMoodCheckBox, mood: "해피모드")
        
        // UITextFieldDelegate를 설정
        studyTitle.delegate = self
        
        // 초기 MaxMemberNum 설정
        MaxMemberNum.text = String(maxMemberCount)
    }


    @IBAction func placeSegmentValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            // 선택된 세그먼트가 0일 때 (온라인 버튼일 때)
            placeTextField.isHidden = true // 숨김
        } else {
            placeTextField.isHidden = false // 다른 경우에는 보임
        }
    }
    
    
    @IBAction func startDateButton(_ sender: UIButton) {
        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
        let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
        let today = Date()
        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
            if selected, let selectedDate = date {
                let toPostDateFormatter = DateFormatter()
                toPostDateFormatter.dateFormat = "yyyy-MM-dd"
                let toPostDate = toPostDateFormatter.string(from: selectedDate)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "  yyyy년 MM월 dd일 부터"
                let selectedDateString = dateFormatter.string(from: selectedDate)
                self.startDate.setTitle(selectedDateString, for: .normal)
                self.postStartDate = toPostDate
            } else {
                print("Cancelled")
            }
        }
        // Display
        datePicker.show(in: self, on: sender)
    }
    
    @IBAction func endDateButton(_ sender: UIButton) {
        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
            let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
            let today = Date()
            // Create picker object
            let datePicker = DatePicker()
            // Setup
            datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
                if selected, let selectedDate = date {
                    let toPostDateFormatter = DateFormatter()
                    toPostDateFormatter.dateFormat = "yyyy-MM-dd"
                    let toPostDate = toPostDateFormatter.string(from: selectedDate)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "  yyyy년 MM월 dd일 까지"
                    let selectedDateString = dateFormatter.string(from: selectedDate)
                    self.endDate.setTitle(selectedDateString, for: .normal)
                    self.postEndDate = toPostDate
                } else {
                    print("Cancelled")
                }
            }
            // Display
            datePicker.show(in: self, on: sender)
        }
    
    func setupView(_ view: UIView, with checkBox: UIImageView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
        checkBox.image = UIImage(named: "createStudy_unclicked")
    }
    
    func addTapGesture(to view: UIView, with checkBox: UIImageView, mood: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.tag = 0
        checkBox.tag = view.tag
        view.accessibilityLabel = mood // 분위기에 대한 문자열 레이블 추가
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view, let mood = tappedView.accessibilityLabel {
            studyMood = mood // 선택한 분위기 저장
            resetCheckBoxes()
            tappedView.layer.borderColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
            tappedView.layer.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
            
            if let checkBox = tappedView.subviews.compactMap({ $0 as? UIImageView }).first {
                checkBox.image = UIImage(named: "createStudy_clicked")
            }
        }
    }
    
    func resetCheckBoxes() {
        for view in [firstMood, secondMood, thirdMood] {
            view?.layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1).cgColor
            view?.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        }
        
        for checkBox in [firstMoodCheckBox, secondMoodCheckBox, thirdMoodCheckBox] {
            checkBox?.image = UIImage(named: "createStudy_unclicked")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 새로운 텍스트 입력을 포함한 전체 텍스트
        let updatedText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        // 글자 수 제한 (20자)
        let maxLength = 20
        return updatedText.count <= maxLength
    }
    
    // 텍스트 필드 입력 종료 시 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == studyTitle {
            // studyTitle TextField에서 입력이 종료될 때 실행할 코드
            if let text = textField.text {
                studyTitleText = text
            }
        }
    }
    
    @IBAction func memberCountUpTapped(_ sender: UIButton) {
        if maxMemberCount < 10 {
            maxMemberCount += 1
            MaxMemberNum.text = String(maxMemberCount)
        }
    }
    
    @IBAction func memberCountDownTapped(_ sender: UIButton) {
        if maxMemberCount > 1 {
            maxMemberCount -= 1
            MaxMemberNum.text = String(maxMemberCount)
        }
    }
}
