//
//  HomeViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var moveToTestView: UIView!
    @IBOutlet weak var showMoreStudies: UIImageView!
    @IBOutlet weak var navToSurveyBtn: UIView!
    
    @IBOutlet weak var recruitingStudy1: StudyInputView!
    @IBOutlet weak var recruitingStudy2: StudyInputView!
    
    var pagingViewController: PagingViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        navToSurveyBtn.isUserInteractionEnabled = true
        let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped2))
        navToSurveyBtn.addGestureRecognizer(tap2Gesture)
        
        showMoreStudies.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        showMoreStudies.addGestureRecognizer(tapGesture)
        
        applyShadow()
        fetchRecruitingStudies()
    }
    
    func fetchRecruitingStudies() {
        RecruitingStudyGet.instance.recruitingStudyGet { [weak self] result in
            // Check if result is an array
            if let results = result as? [RecuritingStudyResultModel] {
                // Update the first StudyInputView with the first result if available
                if let firstResult = results.first {
                    self?.updateStudyInputView((self?.recruitingStudy1)!, with: firstResult)
                }

                // Update the second StudyInputView with the second result if available
                if results.count > 1 {
                    self?.updateStudyInputView((self?.recruitingStudy2)!, with: results[1])
                }
            }
        }
    }



    func updateStudyInputView(_ studyInputView: StudyInputView, with data: RecuritingStudyResultModel) {
        studyInputView.titleLabel.text = data.title
        studyInputView.locationLabel.text = data.location
        studyInputView.dateLabel.text = data.startDate
        studyInputView.memberLabel.text = "\(data.memberNum)"  // Assuming memberNum is Int
        studyInputView.categoryLabel.text = data.category
    }

    
    @IBAction func category1BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 1)
    }
    @IBAction func category2BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 2)
    }
    @IBAction func category3btnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 3)
    }
    
    @IBAction func category4BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 4)
    }
    @IBAction func category5BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 5)
    }
    
    @IBAction func category6BtnTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "navToCategory", sender: 6)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToCategory" {
            if let pagingViewController = segue.destination as? PagingViewController, let pageIndex = sender as? Int {
                // 원하는 페이지로 selectedPageIndex를 설정
                pagingViewController.selectedPageIndex = pageIndex
            }
        }
    }
    
    @objc func imageTapped() {
        self.performSegue(withIdentifier: "navToCategory", sender: self)
    }
    
    @objc func imageTapped2() {
        print(#fileID, #function, #line, "- exitButton clicked")
        self.performSegue(withIdentifier: "navToSurvey", sender: self)
        let surveyViewController = SurveyVC()
        surveyViewController.hidesBottomBarWhenPushed = true
    }
    
    fileprivate func applyShadow() {
        print(#fileID, #function, #line, "shadow 적용 함수 접근")
        self.moveToTestView.layer.cornerRadius = 16
        self.moveToTestView.layer.backgroundColor = UIColor(hex: "FF5454").cgColor
        self.moveToTestView.layer.masksToBounds = false
    }
    @IBAction func createStudyBtnTapped(_ sender: Any) {
        if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 2            }
    }
}


