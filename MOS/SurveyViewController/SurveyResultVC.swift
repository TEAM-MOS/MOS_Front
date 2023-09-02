//
//  SurveyResultVC.swift
//  MOS
//
//  Created by 김지은 on 2023/06/19.
//

import Foundation
import UIKit
class SurveyResultVC: UIViewController{
    @IBOutlet weak var categoryOneProgressBar: UIProgressView!
    @IBOutlet weak var categoryTwoProgressBar: UIProgressView!
    @IBOutlet weak var categoryThreeProgressBar: UIProgressView!
    @IBOutlet weak var categoryFourProgressBar: UIProgressView!
    @IBOutlet weak var graphbackground: UIView!
    
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var resultCharacter: UIImageView!
    var categoryOneScore: Int = 0
    var categoryTwoScore: Int = 0
    var categoryThreeScore: Int = 0
    var categoryFourScore: Int = 0
    var lowProgressBarColor = UIColor(red: 136.0 / 255.0, green: 140.0 / 255.0, blue: 134.0 / 255.0, alpha: 1.0)
    
        override func viewDidLoad() {
            super.viewDidLoad()
            updateProgressBar()
            updateViewBackground(graphbackground)
            updateTotalScore()

            
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
        
            if categoryOneProgress < 0.6 {
                categoryOneProgressBar.progressTintColor = lowProgressBarColor
                }
            if categoryTwoProgress < 0.6 {
                categoryTwoProgressBar.progressTintColor = lowProgressBarColor
            }
            if categoryThreeProgress < 0.6 {
                categoryThreeProgressBar.progressTintColor = lowProgressBarColor
            }
            if categoryFourProgress < 0.6 {
                categoryFourProgressBar.progressTintColor = lowProgressBarColor
            }
        
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
        }    }
    
        
    }
