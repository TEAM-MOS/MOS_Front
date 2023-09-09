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
        
        if total < 40 {
            resultCharacter.image = UIImage(named: "survey_monandol_character")
        } else if (40 < total) && (total < 60) {
            resultCharacter.image = UIImage(named: "survey_mole_character")
        } else {
            resultCharacter.image = UIImage(named: "survey_mohum_character")
        }
    }
}

