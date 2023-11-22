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
    @IBOutlet weak var lowestCategoryName: UILabel!
    @IBOutlet weak var categoryFourProgressBar: RoundedProgressView!
    @IBOutlet weak var graphbackground: UIView!
    
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
        // Find the lowest progress
        let lowestProgress = min(categoryOneProgress, categoryTwoProgress, categoryThreeProgress, categoryFourProgress)
        
        categoryOneProgressBar.progress = categoryOneProgress
        categoryOneProgressBar.lowestProgress = lowestProgress
                
        categoryTwoProgressBar.progress = categoryTwoProgress
        categoryTwoProgressBar.lowestProgress = lowestProgress
        
        categoryThreeProgressBar.progress = categoryThreeProgress
        categoryThreeProgressBar.lowestProgress = lowestProgress
        
        categoryFourProgressBar.progress = categoryFourProgress
        categoryFourProgressBar.lowestProgress = lowestProgress
    }

    
    func updateViewBackground(_ buttonView: UIView) {
        buttonView.layer.cornerRadius = 16
        buttonView.layer.borderWidth = 1
        buttonView.layer.borderColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        buttonView.backgroundColor = .clear
    }
    
    func updateTotalScore() {
        var lowestCategory: String = ""

        if categoryOneScore < categoryTwoScore && categoryOneScore < categoryThreeScore && categoryOneScore < categoryFourScore {
            lowestCategory = "CategoryOne"
        } else if categoryTwoScore < categoryOneScore && categoryTwoScore < categoryThreeScore && categoryTwoScore < categoryFourScore {
            lowestCategory = "CategoryTwo"
        } else if categoryThreeScore < categoryOneScore && categoryThreeScore < categoryTwoScore && categoryThreeScore < categoryFourScore {
            lowestCategory = "CategoryThree"
        } else if categoryFourScore < categoryOneScore && categoryFourScore < categoryTwoScore && categoryFourScore < categoryThreeScore {
            lowestCategory = "CategoryFour"
        } else {
            lowestCategory = "Multiple categories have the same lowest score" // 동점인 경우
        }
        
        if lowestCategory == "CategoryOne" {
            resultCharacter.image = UIImage(named: "survey_lowest_category1")
            lowestCategoryName.text = "산업&기업 분석"
        } else if lowestCategory == "CategoryTwo"{
            resultCharacter.image = UIImage(named: "survey_lowest_category2")
            lowestCategoryName.text = "시사 PT"
        } else if lowestCategory == "CategoryThree"{
            resultCharacter.image = UIImage(named: "survey_lowest_category3")
            lowestCategoryName.text = "자소서"
        }else if lowestCategory == "CategoryFour"{
            resultCharacter.image = UIImage(named: "survey_lowest_category4")
            lowestCategoryName.text = "면접"
        }else{
            
        }
    }
}


