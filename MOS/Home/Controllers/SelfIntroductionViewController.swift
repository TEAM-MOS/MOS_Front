//
//  SelfIntroductionViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/06/20.
//

import UIKit

class SelfIntroductionViewController: UIViewController {
    @IBOutlet weak var recruitingSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 모집 중 스위치 사이즈 조절
        recruitingSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
