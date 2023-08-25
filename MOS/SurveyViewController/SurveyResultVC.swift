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
    
    var categoryOneScore: Int = 0
    var categoryTwoScore: Int = 0
    var categoryThreeScore: Int = 0
    var categoryFourScore: Int = 0
    
        override func viewDidLoad() {
            super.viewDidLoad()
            updateProgressBar()
            updateViewBackground(graphbackground)
        
            
        }
    
    func updateProgressBar() {
        let maxScorePerCategory = 20.0 // The maximum score per category
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
    
    
        
    }
