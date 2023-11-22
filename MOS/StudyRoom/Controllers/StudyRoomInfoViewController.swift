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
    

    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setData()
        
    }
    

    func setData() {
        categoryLabel.text = "산업&기업 분석"
        studyTypeLabel.text = "빡공 모드"
        studyNameLabel.text = "2023 상반기 네이버 면접 준비 스터디"
        creatorUserImage.image = UIImage(named: "ic_home_members")
        creatorNickname.text = "내가먼저취뽀"
        studyDateLabel.text = "04.15~05.15"
        studyMemNumLabel.text = "6명"
        studyRuleLabel.text = "studyDateView.layer.borderColor = UIColor(named: inactive_button_bg)?.cgColorstudyDateView.layer.cornerRadius = 8studyDateView.layer.borderWidth = 1"
        
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
    }
}
