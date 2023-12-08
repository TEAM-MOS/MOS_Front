//
//  HomeViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit
import Kingfisher

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
        
        let tapStudy1 = UITapGestureRecognizer(target: self, action: #selector(recruitingStudyTapped))
        recruitingStudy1.addGestureRecognizer(tapStudy1)
        
        let tapStudy2 = UITapGestureRecognizer(target: self, action: #selector(recruitingStudyTapped))
        recruitingStudy2.addGestureRecognizer(tapStudy2)
        
        applyShadow()
        fetchRecruitingStudies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Fetch recruiting studies when the view is about to appear
            fetchRecruitingStudies()
        }
    
    @objc func recruitingStudyTapped() {
        // StudyDetailViewController로 이동하는 segue 수행
        if let studyDetailVC = UIStoryboard(name: "Study", bundle: nil).instantiateViewController(withIdentifier: "studyDetailVC") as? StudyDetailViewController {
            self.navigationController?.pushViewController(studyDetailVC, animated: false)
        }
    }
    
    func fetchRecruitingStudies() {
        RecruitingStudyGet.instance.recruitingStudyGet { [weak self] result in
            // Check if result is an array
            if let results = result as? [RecuritingStudyResultModel] {
                // Update the first StudyInputView with the last result if available
                if let lastResult = results.last {
                    self?.updateStudyInputView((self?.recruitingStudy1)!, with: lastResult)
                }

                // Update the second StudyInputView with the second-to-last result if available
                if results.count > 1 {
                    let secondToLastIndex = results.count - 2
                    self?.updateStudyInputView((self?.recruitingStudy2)!, with: results[secondToLastIndex])
                }
            }
        }
    }




    func updateStudyInputView(_ studyInputView: StudyInputView, with data: RecuritingStudyResultModel) {
        studyInputView.titleLabel.text = data.title
        if data.location != nil {
            studyInputView.locationLabel.text = data.location
        } else {
            studyInputView.locationLabel.isHidden = true
            studyInputView.locationImage.image = UIImage(named: "zoom_selected")
            studyInputView.locationImage.contentMode = .scaleAspectFit

            // Assuming there are width and height constraints for locationImage
            var widthConstraint: NSLayoutConstraint?
            var heightConstraint: NSLayoutConstraint?

            for constraint in studyInputView.locationImage.constraints {
                if constraint.firstAttribute == .width {
                    widthConstraint = constraint
                } else if constraint.firstAttribute == .height {
                    heightConstraint = constraint
                }
            }

            // Update constraints if found
            widthConstraint?.constant = 62
            heightConstraint?.constant = 24

            // Update layout
            studyInputView.layoutIfNeeded()
        }
        
        if let startDate = formatDate(data.startDate) {
            studyInputView.dateLabel.text = startDate
        } else {
            studyInputView.dateLabel.text = "Invalid Date"
        }
        let membersText = "\(data.memberNum)/\(data.maxMember)"
        studyInputView.memberLabel.text = membersText
        studyInputView.categoryLabel.text = data.category
        if let leaderImageUrl = data.leaderImageUrl, let url = URL(string: leaderImageUrl) {
            // Load the image if leaderImageUrl is not null and is a valid URL
            studyInputView.leaderImage.kf.setImage(with: url)
        } else {
            // Set a default image if leaderImageUrl is null or an invalid URL
            studyInputView.leaderImage.image = UIImage(named: "AppIcon")
        }
    
    }
    
    func formatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            // Format the date as "2/15(토)"
            dateFormatter.dateFormat = "M/d(EEE)"
            dateFormatter.locale = Locale(identifier: "ko_KR") // Set locale to Korean for day of the week
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return nil
        }
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
                pagingViewController.hidesBottomBarWhenPushed = true
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


