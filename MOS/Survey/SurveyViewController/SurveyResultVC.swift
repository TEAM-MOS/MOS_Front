//
//  SurveyResultVC.swift
//  MOS
//
//  Created by 김지은 on 2023/06/19.
//

import Foundation
import UIKit

class SurveyResultVC: UIViewController {
    @IBOutlet weak var categoryOneProgressBar: RoundedProgressView!
    @IBOutlet weak var categoryTwoProgressBar: RoundedProgressView!
    @IBOutlet weak var categoryThreeProgressBar: RoundedProgressView!
    @IBOutlet weak var categoryFourProgressBar: RoundedProgressView!
    @IBOutlet weak var graphbackground: UIView!
    
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var resultCharacter: UIImageView!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var contentLabel: UILabel!
    var categoryOneScore: Int = 0
    var categoryTwoScore: Int = 0
    var categoryThreeScore: Int = 0
    var categoryFourScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.layer.cornerRadius = 8
        updateProgressBar()
        updateViewBackground(graphbackground)
        updateTotalScore()
        
        finishButton.isUserInteractionEnabled = true
        let finishBtnClick = UITapGestureRecognizer(target: self, action: #selector(finishBtnTapped))
        finishButton.addGestureRecognizer(finishBtnClick)
    }
    
    @objc func finishBtnTapped() {
        self.performSegue(withIdentifier: "navToHome", sender: self)
    }
    
    func updateProgressBar() {
        let maxScorePerCategory = 25.0 // The maximum score per category
        let categoryOneProgress = Float(categoryOneScore) / Float(maxScorePerCategory)
        let categoryTwoProgress = Float(categoryTwoScore) / Float(maxScorePerCategory)
        let categoryThreeProgress = Float(categoryThreeScore) / Float(maxScorePerCategory)
        let categoryFourProgress = Float(categoryFourScore) / Float(maxScorePerCategory)
        
        categoryOneProgressBar.progress = categoryOneProgress
        categoryTwoProgressBar.progress = categoryTwoProgress
        categoryThreeProgressBar.progress = categoryThreeProgress
        categoryFourProgressBar.progress = categoryFourProgress
    }

    
    func updateViewBackground(_ buttonView: UIView) {
        buttonView.layer.cornerRadius = 16
        buttonView.layer.borderWidth = 1
        buttonView.layer.borderColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        buttonView.backgroundColor = .clear
    }
    
    func updateTotalScore() {
        let total = categoryOneScore + categoryTwoScore + categoryThreeScore + categoryFourScore
        totalScore.text = "\(total)점"
        
        var lackingSkills = ""
        
        if categoryOneProgressBar.progress < 0.6 {
            lackingSkills += "산업 & 기업 분석, "
        }
        if categoryTwoProgressBar.progress < 0.6 {
            lackingSkills += "시사 PT, "
        }
        if categoryThreeProgressBar.progress < 0.6 {
            lackingSkills += "자기소개서, "
        }
        if categoryFourProgressBar.progress < 0.6 {
            lackingSkills += "면접, "
        }
        
        if !lackingSkills.isEmpty {
            lackingSkills = String(lackingSkills.dropLast(2)) // 마지막에 추가된 ", " 제거
        }
        
        if categoryOneProgressBar.progress < 0.6 && categoryTwoProgressBar.progress < 0.6 && categoryThreeProgressBar.progress < 0.6 && categoryFourProgressBar.progress < 0.6  {
            resultCharacter.image = UIImage(named: "survey_monandol_character")
            contentLabel.text = "당신은 취업을 준비를 막 시작한 모난돌 단계입니다.\n부족한 역량: \(lackingSkills)"
        } else if categoryOneProgressBar.progress < 0.6 || categoryTwoProgressBar.progress < 0.6 || categoryThreeProgressBar.progress < 0.6  || categoryFourProgressBar.progress < 0.6 {
            resultCharacter.image = UIImage(named: "survey_mole_character")
            contentLabel.text = "당신은 취업할 준비가 좀 더 필요한 모래 단계입니다.\n부족한 역량: \(lackingSkills)"
        } else {
            resultCharacter.image = UIImage(named: "survey_mohum_character")
            contentLabel.text = "당신은 취업할 준비가 끝난 모험 단계입니다.\n자신에게 믿음을 갖고 출발해봅시다!"
        }
    }
}


