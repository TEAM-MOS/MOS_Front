//
//  HomeViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class HomeViewController:UIViewController {
    @IBOutlet weak var moveToTestView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyShadow()
    }
    
    fileprivate func applyShadow(){
        print(#fileID, #function, #line, "shadow 적용 함수 접근")
        self.moveToTestView.layer.cornerRadius = 16
        self.moveToTestView.layer.shadowColor = UIColor.gray.cgColor //색상
        self.moveToTestView.layer.shadowOpacity = 0.1 //alpha값
        self.moveToTestView.layer.shadowRadius = 10 //반경
        self.moveToTestView.layer.shadowOffset = CGSize(width: 0, height: 0) //위치조정
        self.moveToTestView.layer.masksToBounds = false
    }

}
