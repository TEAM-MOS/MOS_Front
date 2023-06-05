//
//  SearchResultViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/30.
//

import UIKit

class SearchResultViewController: UIViewController{
    
    var search_text = ""
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var recruitingSwitch: UISwitch!
    @IBOutlet weak var selectButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        // searchBar의 검색 텍스트 설정
        searchBar.text = search_text
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // 모집 중 스위치 사이즈 조절
        recruitingSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
    }
}

