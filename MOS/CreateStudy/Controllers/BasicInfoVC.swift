//
//  BasicInfoVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/19.
//

import Foundation
import UIKit

class BasicInfoVC: UIViewController{
    
    @IBOutlet weak var firstMood: UIView!
    @IBOutlet weak var secondMood: UIView!
    @IBOutlet weak var thirdMood: UIView!
    @IBOutlet weak var firstMoodCheckBox: UIImageView!
    @IBOutlet weak var secondMoodCheckBox: UIImageView!
    @IBOutlet weak var thirdMoodCheckBox: UIImageView!
    
    // 추구하는 스터디 분위기 저장 변수
    var studyMood: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 추구하는 스터디 분위기 버튼 스타일 설정
        setupView(firstMood, with: firstMoodCheckBox)
        setupView(secondMood, with: secondMoodCheckBox)
        setupView(thirdMood, with: thirdMoodCheckBox)
        
        // 각 뷰에 탭 제스처 추가
        addTapGesture(to: firstMood, with: firstMoodCheckBox, mood: "Hard")
        addTapGesture(to: secondMood, with: secondMoodCheckBox, mood: "soso")
        addTapGesture(to: thirdMood, with: thirdMoodCheckBox, mood: "easy")
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
}
