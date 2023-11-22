//
//  StudyRoomInfoViewController.swift
//  MOS
//
//  Created by yeonsu on 11/20/23.
//

import UIKit
import Foundation

class StudyRoomInfoViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var studyTypeLabel: UILabel!
    @IBOutlet weak var studyNameLabel: UILabel!
    @IBOutlet weak var creatorUserImage: UIImageView!
    @IBOutlet weak var creatorNickname: UILabel!
    @IBOutlet weak var studyDateLabel: UILabel!
    @IBOutlet weak var studyMemNumLabel: UILabel!
    @IBOutlet weak var studyDateView: UIView!
    @IBOutlet weak var studyMemNumView: UIView!
    @IBOutlet weak var onOffCalsuleView: UIStackView!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var studyGoalLabel: UILabel!
    @IBOutlet weak var studyRuleLabel: UILabel!
    
    @IBOutlet weak var studyGoalView: UIView!
    @IBOutlet weak var studyRuleVIew: UIView!
    
    @IBOutlet weak var saturdayView: UIButton!
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setData()
        
    }
    

    func setData() {
        categoryLabel.text = "산업&기업 분석"
        studyTypeLabel.text = "빡공 모드"
        studyNameLabel.text = "2023년 상반기 네이버 IT직군을 위한 심층 분석을 통한 산업&기업분석 스터디"
        creatorUserImage.image = UIImage(named: "profile3")
        creatorNickname.text = "내가먼저취뽀"
        studyDateLabel.text = "12.01~01.08"
        studyMemNumLabel.text = "6명"
        studyRuleLabel.text = "⚠️ 지각비 안내\n미리 얘기하지 않고 지각할 경우 5분 당 500원씩 벌금을 걷고, 스터디 마지막날 팀원들끼리 나눠갖는 것으로 하겠습니다. 시간 꼭 잘 지켜주세요!\n\n💔 가입 전 주의사항\n 조기취업한 경우 제외하고 무단 이탈, 지각, 결석은 안 돼요! 가입 시 신중하게 고려해주세요. 스터디 진행 전 과제 준비는 필수입니다! 지각과 마찬가지로 금액을 정해서 벌금을 걷겠습니다~"
        
    }
    
    func setUI() {
        studyDateView.layer.borderColor = UIColor(named: "inactive_button_bg")?.cgColor
        studyDateView.layer.cornerRadius = 8
        studyDateView.layer.borderWidth = 1
        
        studyMemNumView.layer.borderColor = UIColor(named: "inactive_button_bg")?.cgColor
        studyMemNumView.layer.cornerRadius = 8
        studyMemNumView.layer.borderWidth = 1
        onOffCalsuleView.layer.cornerRadius = 16
                
                // 테두리 추가
        onOffCalsuleView.layer.borderWidth = 1.0
        onOffCalsuleView.layer.borderColor = UIColor(named: "main")?.cgColor
        
        textView.backgroundColor = UIColor(named: "category-1")
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor(named: "subColor")?.cgColor
        
        studyGoalView.layer.cornerRadius = 8
        studyGoalView.layer.borderWidth = 1
        studyGoalView.layer.borderColor = UIColor(hex: "FFE5DE").cgColor
        
        studyRuleVIew.layer.cornerRadius = 8
        studyRuleVIew.layer.borderWidth = 1
        studyRuleVIew.layer.borderColor = UIColor(hex: "FFE5DE").cgColor
        
        saturdayView.layer.cornerRadius = 4
        
        creatorUserImage.layer.cornerRadius = creatorUserImage.bounds.width / 2
    }
}
