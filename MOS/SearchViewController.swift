//
//  SearchViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
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
