//
//  SearchResultViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/30.
//

import UIKit
import DropDown

class SearchResultViewController: UIViewController{
    
    var search_text = ""
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var recruitingSwitch: UISwitch!
    @IBOutlet weak var dropButtonView: UIView!
    @IBOutlet weak var dropDownIcon: UIImageView!
    @IBOutlet weak var dropButtonText: UITextField!
    @IBOutlet weak var studyInputView: StudyInputView!
    
    // DropDown 버튼 객체 생성
    let dropDown = DropDown()
    
    // DropDown 버튼 아이템 리스트
    let dropDownItemList = ["인기순", "최신순"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        // searchBar의 검색 텍스트 설정
        searchBar.text = search_text
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // 모집 중 스위치 사이즈 조절
        recruitingSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
        
        // DropDown 버튼 UI 함수 호출
        dropDownUI()
        setDropDownButton()
        
        // 스터디 상세 페이지로 이동
        // viewMap: View 객체
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        studyInputView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // DropDown 버튼 UI
    func dropDownUI() {
        
        // DropDown View의 배경
        dropButtonView.layer.cornerRadius = 14
        dropButtonView.layer.borderWidth = 1
        dropButtonView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        DropDown.appearance().textColor = UIColor.black // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.red // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(8)
        DropDown.appearance().shadowColor = UIColor.lightGray
        dropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
                
        dropButtonText.text = "정렬" // 힌트 텍스트
        dropDownIcon.tintColor = UIColor.gray
    }
    
    // DropDown 버튼 동작 설정
    func setDropDownButton() {
        // 버튼 아이템 설정
        dropDown.dataSource = dropDownItemList
        
        // 버튼 클릭 시 나오는 뷰 위치 설정
        dropDown.anchorView = self.dropButtonView
        dropDown.bottomOffset = CGPoint(x: 0, y: dropButtonView.bounds.height)
        
        // 버튼 클릭 시 처리
        dropDown.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.dropButtonText.text = item
            self!.dropDownIcon.image = UIImage.init(named: "icon_arrow_down")
        }
        
        // 취소 시 처리
        dropDown.cancelAction = { [weak self] in
            //빈 화면 터치 시 DropDown이 사라지고 아이콘을 원래대로 변경
            self!.dropDownIcon.image = UIImage.init(named: "icon_arrow_down")
        }
    }
    
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        // 다른 파일 스토리보드 가져오기
        let studyDetailStodyboard = UIStoryboard.init(name: "Study", bundle: nil)
        // studyDetail 스토리보드에 있는 VC값 가져오기
        guard let nextVC = studyDetailStodyboard.instantiateViewController(withIdentifier: "studyDetailVC")as? StudyDetailViewController else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // 드롭다운 버튼 눌렀을 때 처리
    @IBAction func dropDownButtonClicked(_ sender: Any) {
        dropDown.show()
        self.dropDownIcon.image = UIImage.init(named: "icon_arrow_up")
    }
}

