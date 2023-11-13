//
//  MyPageViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//
import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var mypageName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        getProfile()
        
        myImage.layer.cornerRadius = myImage.bounds.width / 2
        myImage.layer.masksToBounds = true
    }

    func getProfile() {
        MypageGet.instance.mypageGet { [weak self] result in
            // Check if result is not nil
            if let mypageResult = result {
                // Update UI elements with the received data
                self?.updateUI(with: mypageResult)
            }
        }
    }

    func updateUI(with mypageResult: MypageResultModel) {
        mypageName.text = mypageResult.nickname

        if let imageUrlString = mypageResult.imageUrl, let imageUrl = URL(string: imageUrlString) {
            myImage.kf.setImage(with: imageUrl)
        } else {
            // Set a default image if imageUrl is nil or an invalid URL
            print("이미지 없음")
            myImage.image = UIImage(named: "defaultImage")
        }
    }
}

