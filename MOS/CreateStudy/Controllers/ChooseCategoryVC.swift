//
//  AddStudyViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class ChooseCategoryVC: UIViewController{

    
    @IBOutlet weak var testBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    // 버튼 클릭 이벤트 핸들러
       @IBAction func testBtnTapped(_ sender: UIButton) {
           // 세그웨이를 실행하여 화면 이동
           performSegue(withIdentifier: "step2", sender: nil)
       }
}
