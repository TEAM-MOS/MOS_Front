//
//  SearchResultViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/30.
//

import UIKit
import DropDown

class SearchResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var search_text = ""
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var recruitingSwitch: UISwitch!
    @IBOutlet weak var dropButtonView: UIView!
    @IBOutlet weak var dropDownIcon: UIImageView!
    @IBOutlet weak var dropButtonText: UITextField!


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StudyList.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용 가능한 셀을 가져옴 (indexPath 번째)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyListCell", for: indexPath) as? StudyListCollectionViewCell else {
            // casting 실패 시
            return UICollectionViewCell()
        }
        
        let studyListCell = StudyList.list[indexPath.item]
        // indexPath 안에는 섹션에 대한 정보, 섹션에 들어가는 데이터 정보 등이 있다
        cell.configure(studyListCell)
        return cell
    }

    
    // DropDown 버튼 객체 생성
    let dropDown = DropDown()
    
    // DropDown 버튼 아이템 리스트
    let dropDownItemList = ["인기순", "최신순"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        
        leadingConstraint.isActive = true
        
        let trailingConstraint = collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        trailingConstraint.isActive = true
        

        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        // searchBar의 검색 텍스트 설정
        searchBar.text = search_text
     
        
        // 모집 중 스위치 사이즈 조절
        recruitingSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
        
        // DropDown 버튼 UI 함수 호출
        dropDownUI()
        setDropDownButton()
        
        // 스터디 상세 페이지로 이동
        // viewMap: View 객체
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        studyInputView.addGestureRecognizer(tapGestureRecognizer)
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
        navigationController?.show(nextVC, sender: nil) //새로운 방식
    }
    
    // 드롭다운 버튼 눌렀을 때 처리
    @IBAction func dropDownButtonClicked(_ sender: Any) {
        dropDown.show()
        self.dropDownIcon.image = UIImage.init(named: "icon_arrow_up")
    }
    
    
    @IBAction func tempButton(_ sender: Any) {
        let studyDetailStodyboard = UIStoryboard.init(name: "Search", bundle: nil)
        guard let nextVC = studyDetailStodyboard.instantiateViewController(withIdentifier: "StudyListVC")as? StudyListViewController else {return}
        nextVC.modalPresentationStyle = .fullScreen
        navigationController?.show(nextVC, sender: nil) //새로운 방식
    }
}


// ====== ✨ collection view dynamic height ======
// 타이틀 사이즈에 따른 height값 조절
extension SearchResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let studyList = StudyList.list[indexPath.item]
           
           let titleFont = UIFont.systemFont(ofSize: 17) // 적절한 폰트 사용
           let titleText = studyList.title
           let titleMaxWidth = collectionView.bounds.width /* 패딩이나 제약조건 조절 */
           
           let titleHeight = titleText.height(withConstrainedWidth: titleMaxWidth, font: titleFont)
           
           // 제목 레이블 높이를 기반으로 원하는 셀 높이 계산
        let cellHeight = titleHeight + 130.0 /* 다른 셀 요소에 대한 높이 추가 */
           
           return CGSize(width: collectionView.bounds.width, height: cellHeight)
       }
}
