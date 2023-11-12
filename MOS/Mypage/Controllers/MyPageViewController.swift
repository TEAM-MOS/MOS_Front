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
    }
    
    func getProfile() {
        MypageGet.instance.mypageGet { [weak self] result in
            // Check if result is not empty
            if let mypageResult = result.first {
                // Update UI elements with the received data
                self?.updateUI(with: mypageResult)
            }
        }
    }
    
    func updateUI(with mypageResult: MypageResultModel) {
        mypageName.text = mypageResult.nickname
        
        if let imageUrl = URL(string: mypageResult.imageUrl) {
            myImage.kf.setImage(with: imageUrl)
        } else {
            // Set a default image if imageUrl is invalid
            myImage.image = UIImage(named: "defaultImage")
        }
    }
    
}
