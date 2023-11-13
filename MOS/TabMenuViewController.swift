//
//  TabMenuViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class TabMenuViewController:UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }

}
