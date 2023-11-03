//
//  AddStudyViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class ChooseCategoryVC: UIViewController{

    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var category1Btn: UIButton!
    @IBOutlet weak var category2Btn: UIButton!
    @IBOutlet weak var category3Btn: UIButton!
    @IBOutlet weak var category4Btn: UIButton!
    @IBOutlet weak var category5Btn: UIButton!
    @IBOutlet weak var category6Btn: UIButton!
    
    // 카테고리 번호를 저장할 변수
    var selectedCategory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 0 // 0은 첫 번째 탭을 나타냅니다. 적절한 인덱스로 변경하세요.
            }
    }

    // 각 카테고리 버튼을 탭했을 때 호출되는 메서드
        @IBAction func categoryButtonTapped(_ sender: UIButton) {
            // 선택한 카테고리 번호 저장
            selectedCategory = sender.tag
            // Storyboard에서 "BasicInfoVC"의 식별자에 해당하는 뷰 컨트롤러를 가져옵니다.
            if let basicInfoVC = storyboard?.instantiateViewController(withIdentifier: "BasicInfoVC") as? BasicInfoVC {
                // 선택한 카테고리 번호를 다음 뷰 컨트롤러에 전달
                basicInfoVC.selectedCategory = selectedCategory
                self.navigationController?.pushViewController(basicInfoVC, animated: false)
            }
        }
    
    // 세그웨이 실행 전에 데이터를 전달
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "step2" {
                if let destinationViewController = segue.destination as? BasicInfoVC {
                    // 선택한 카테고리 번호를 다음 뷰 컨트롤러로 전달
                    destinationViewController.selectedCategory = selectedCategory
                }
            }
        }
}
