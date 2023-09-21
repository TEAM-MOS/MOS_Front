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
        self.moveToTestView.layer.cornerRadius = 8
        self.moveToTestView.layer.shadowColor = UIColor.gray.cgColor // 색상
        self.moveToTestView.layer.shadowOpacity = 0.1 // alpha값
        self.moveToTestView.layer.shadowRadius = 10 // 반경
        self.moveToTestView.layer.shadowOffset = CGSize(width: 0, height: 0) // 위치조정
        self.moveToTestView.layer.masksToBounds = false
    }
}


