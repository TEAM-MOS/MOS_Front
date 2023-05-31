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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        // searchBar의 검색 텍스트 설정
        searchBar.text = search_text
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

