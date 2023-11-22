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
    @IBOutlet weak var progressBarView2: UIProgressView!
    @IBOutlet weak var progressBarView3: UIProgressView!
    @IBOutlet weak var progressBarView4: UIProgressView!
    @IBOutlet weak var progressBarView5: UIProgressView!
    @IBOutlet weak var progressBarView6: UIProgressView!
    
    @IBOutlet weak var userImage1: UIImageView!
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userImage2: UIImageView!
    @IBOutlet weak var userImage3: UIImageView!
    @IBOutlet weak var userImage4: UIImageView!
    @IBOutlet weak var userImage5: UIImageView!
    @IBOutlet weak var userImage6: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attributedString()
        setProgressViewUI(progressBarView)
        setProgressViewUI(progressBarView2)
        setProgressViewUI(progressBarView3)
        setProgressViewUI(progressBarView4)
        setProgressViewUI(progressBarView5)
        setProgressViewUI(progressBarView6)
        setUserImage(userImage)
        setUserImage(userImage2)
        setUserImage(userImage3)
        setUserImage(userImage4)
        setUserImage(userImage5)
        setUserImage(userImage6)
        
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
    
    func setProgressViewUI(_ sender: UIProgressView) {
        sender.progressViewStyle = .default
        sender.progressTintColor = UIColor(named: "main")
        sender.trackTintColor = UIColor(named: "gray-1")
        sender.clipsToBounds = true
        sender.layer.cornerRadius = 5
        sender.clipsToBounds = true
        sender.layer.sublayers![1].cornerRadius = 5// 뒤에 있는 회색 track
        sender.subviews[1].clipsToBounds = true
    }
    
    func setUserImage(_ sender: UIImageView) {
        sender.layer.borderWidth = 1
        sender.clipsToBounds = true
        sender.layer.borderColor = UIColor.clear.cgColor
    }
}
