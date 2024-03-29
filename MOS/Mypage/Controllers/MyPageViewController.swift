//
//  MyPageViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//
import UIKit
import Kingfisher

class MyPageViewController: UIViewController {
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var mypageName: UILabel!
    @IBOutlet weak var approvalDetail: UIStackView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var myStudy: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBottomBarWhenPushed = true
        //getProfile()
        
        profileBtn.layer.cornerRadius = 4
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = myImage.bounds.width / 2
        myImage.layer.masksToBounds = true
        myImage.image = UIImage(named: "profile3")
        mypageName.text = "내가먼저취뽀"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(approvalDetailTapped))
        approvalDetail.addGestureRecognizer(tapGesture)
        approvalDetail.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(mystudyTapped))
        myStudy.addGestureRecognizer(tapGesture2)
        myStudy.isUserInteractionEnabled = true
    }
    
    @IBAction func profileDetailBtnTapped(_ sender: UIButton) {
            if let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC {
                profileVC.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(profileVC, animated: false)
            }
        }
    
    @objc func approvalDetailTapped() {
        if let approvalDetailVC = storyboard?.instantiateViewController(withIdentifier: "ApprovalDetailVC") as? ApprovalDetailVC {
                    approvalDetailVC.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(approvalDetailVC, animated: false)
                }
    }
    
    @objc func mystudyTapped() {
        if let myStudyVC = storyboard?.instantiateViewController(withIdentifier: "MystudyVC") as? MystudyVC{
            dot.isHidden = true
            myStudyVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(myStudyVC, animated: false)}
    }
    
//    func getProfile() {
//        MypageGet.instance.mypageGet { [weak self] result in
//            // Check if result is not nil
//            if let mypageResult = result {
//                // Update UI elements with the received data
//                self?.updateUI(with: mypageResult)
//            }
//        }
//    }
//
//    func updateUI(with mypageResult: MypageResultModel) {
//        mypageName.text = mypageResult.nickname
//
//        if let imageUrlString = mypageResult.imageUrl, let imageUrl = URL(string: imageUrlString) {
//            myImage.kf.setImage(with: imageUrl)
//        } else {
//            // Set a default image if imageUrl is nil or an invalid URL
//            myImage.image = UIImage(named: "profile1")
//        }
//    }
}

