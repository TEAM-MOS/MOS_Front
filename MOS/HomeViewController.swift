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
        // Do any additional setup after loading the view.
        
        self.moveToTestView.layer.cornerRadius = 8
        self.moveToTestView.layer.shadowColor = UIColor.gray.cgColor //색상
        self.moveToTestView.layer.shadowOpacity = 0.3 //alpha값
        self.moveToTestView.layer.shadowRadius = 10 //반경
        self.moveToTestView.layer.shadowOffset = CGSize(width: 0, height: 0) //위치조정
        self.moveToTestView.layer.masksToBounds = false
    }

}
