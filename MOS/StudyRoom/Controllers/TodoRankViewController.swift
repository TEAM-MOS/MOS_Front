//
//  TodoRankViewController.swift
//  MOS
//
//  Created by yeonsu on 11/21/23.
//

import UIKit

class TodoRankViewController: UIViewController {
    
    @IBOutlet weak var topRankUserLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var progressBackgroundView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attributedString()
        setProgressViewUI()
        
        self.navigationController?.navigationBar.topItem?.title = "산업&기업 분석"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .darkGray
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // 네비게이션 바 오른쪽 버튼 추가
        let moreIcon = UIImage(named: "icon_more")
        let moreButton = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(moreButtonTapped))
        moreButton.tintColor = .darkGray
        
        self.navigationItem.rightBarButtonItem = moreButton
    }
    
    @objc func moreButtonTapped() {
        // 오른쪽 네비 버튼이 탭되었을 때 수행할 동작 구현
        print("Add button tapped!")
    }
    
    func attributedString() {
        self.topRankUserLabel.font = UIFont(name: "Pretendard-Regular", size: 18)
        guard let text = self.topRankUserLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont(name: "Pretendard-Bold", size: 18)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "헤르미온느"))
        self.topRankUserLabel.attributedText = attributeString
    }
    
    func setProgressViewUI() {
        progressBarView.progressViewStyle = .default
        progressBarView.progressTintColor = UIColor(named: "main")
        progressBarView.trackTintColor = UIColor(named: "gray-1")
        progressBarView.clipsToBounds = true
        progressBarView.layer.cornerRadius = 8
        progressBarView.clipsToBounds = true
        progressBarView.layer.sublayers![1].cornerRadius = 8// 뒤에 있는 회색 track
        progressBarView.subviews[1].clipsToBounds = true
        progressBackgroundView.layer.cornerRadius = 8
        progressBackgroundView.backgroundColor = UIColor(named: "light-gray")
        progressBackgroundView.layer.borderWidth = 1
        progressBackgroundView.layer.borderColor = UIColor.systemGray5.cgColor
        progressLabel.font = UIFont(name: "Pretendard-Bold", size: 16)
    }
}
