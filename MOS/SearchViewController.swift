//
//  SearchViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    
    // 최근 검색어
    @IBOutlet weak var recentSearchButtonView: UIView!
    @IBOutlet weak var recentSearchButtonView2: UIView!
    
    // 추천 검색어
    @IBOutlet weak var button_kakao: UIButton!
    @IBOutlet weak var button_samsung: UIButton!
    @IBOutlet weak var button_sk: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 디바이스별 추천 검색어 버튼 크기 조절
        if DeviceManager.shared.isFourIncheDevices() {
//            sampleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
            button_kakao.widthAnchor.constraint(equalToConstant: 76)
            button_kakao.heightAnchor.constraint(equalToConstant: 34)
            print("4인치")
        } else if DeviceManager.shared.isFiveIncheDevices() {
            button_kakao.widthAnchor.constraint(equalToConstant: 96)
            button_kakao.heightAnchor.constraint(equalToConstant: 40)
            print("5인치")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        // 최근 검색어 버튼 border
        recentSearchButtonView?.layer.borderColor = UIColor.systemGray6.cgColor
        recentSearchButtonView?.layer.borderWidth = 1
        recentSearchButtonView?.layer.cornerRadius = 16
        recentSearchButtonView2?.layer.borderColor = UIColor.systemGray6.cgColor
        recentSearchButtonView2?.layer.borderWidth = 1
        recentSearchButtonView2?.layer.cornerRadius = 16
    }
    
    
    @IBAction func kakaoButtonPressed(_ sender: Any) {
        // 카카오 버튼 클릭
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultViewController else { return }
        nextVC.search_text = "카카오"
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

// 검색 textField 좌측 아이콘 추가
extension UITextField {
    func setupLeftSideImage(ImageViewNamed: String){
        let imageView = UIImageView(frame: CGRect(x: 12, y: 12, width: 16, height: 16))
        imageView.image = UIImage(named: ImageViewNamed)
        let imageViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 42))
        imageViewContainer.addSubview(imageView)
        leftView = imageViewContainer
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}


