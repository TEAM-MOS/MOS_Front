//
//  profileVC.swift
//  MOS
//
//  Created by 김지은 on 2023/11/14.
//

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var tend2: UILabel!
    @IBOutlet weak var tend1: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var targetCompany: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getProfile()
        
        btnEdit.layer.cornerRadius = 4
        view1.backgroundColor = UIColor(hex: "F9F9F9")
        view1.layer.cornerRadius = 8
        view2.backgroundColor = UIColor(hex: "F9F9F9")
        view2.layer.cornerRadius = 8
        view3.backgroundColor = UIColor(hex: "FFE7E7")
        view3.layer.cornerRadius = 10
        view4.backgroundColor = UIColor(hex: "FFE7E7")
        view4.layer.cornerRadius = 10
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.bounds.width / 2
        image.layer.masksToBounds = true
        image.image = UIImage(named: "profile3")
        nickname.text = "내가먼저취뽀"
        
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
//        nickname.text = mypageResult.nickname
//        targetCompany.text = mypageResult.company
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        if let date = dateFormatter.date(from: mypageResult.strDuration ?? "2023-10-12T00:00:00.000+00:00") {
//            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
//            let formattedDate = dateFormatter.string(from: date)
//            startDate.text = formattedDate
//        } else {
//            print("Failed to convert date string to Date")
//        }
//        tend1.text = mypageResult.tend1
//        tend2.text = mypageResult.tend2
//
//        if let imageUrlString = mypageResult.imageUrl, let imageUrl = URL(string: imageUrlString) {
//            image.kf.setImage(with: imageUrl)
//        } else {
//            // Set a default image if imageUrl is nil or an invalid URL
//            print("이미지 없음")
//            image.image = UIImage(named: "defaultImage")
//        }
//    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        guard let navigationControllers = self.navigationController?.viewControllers else { return }
        for viewController in navigationControllers {
            print(viewController)
            if let previousVC = viewController as? MyPageViewController {
                self.navigationController?.popToViewController(previousVC, animated: false)
                break
            }
        }

    }
}
