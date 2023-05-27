//
//  HomeViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class HomeViewController:UIViewController {
    
    @IBOutlet var bgCreateStudy: UIView!
    @IBInspectable
       var shadowEffect: CGFloat = 0 {
           didSet {
               DispatchQueue.main.async {
                   self.bgCreateStudy.layer.shadowColor = UIColor(named: "gray-1")?.cgColor
                   self.bgCreateStudy.layer.shadowOpacity = 0.25
                   self.bgCreateStudy.layer.shadowRadius = 16
                   let blurEffect = UIBlurEffect(style: .light)
                   let blurView = UIVisualEffectView(effect: blurEffect)
                   blurView.frame = self.bgCreateStudy.bounds
                   self.bgCreateStudy.insertSubview(blurView, at: 0)
                   
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
