//
//  SearchViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/05/24.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UITextField!
    
    var getSearchDatas = [[""]]
    
    // 최근 검색어
    /*
    @IBOutlet weak var recentSearchButtonText: UILabel!
    @IBOutlet weak var recentSearchButtonView: UIView!
     */
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var selected = [String]()
    
    // 추천 검색어
    @IBOutlet weak var button_kakao: UIButton!
    @IBOutlet weak var button_samsung: UIButton!
    @IBOutlet weak var button_sk: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 디바이스별 추천 검색어 버튼 크기 조절
        if DeviceManager.shared.isFourIncheDevices() {
            //            sampleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
            button_kakao.widthAnchor.constraint(equalToConstant: 76)
            button_kakao.heightAnchor.constraint(equalToConstant: 34)
            print("4인치")
        } else if DeviceManager.shared.isFiveIncheDevices() {
            button_kakao.widthAnchor.constraint(equalToConstant: 96)
            button_kakao.heightAnchor.constraint(equalToConstant: 40)
            print("5인치")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        collectionView.collectionViewLayout = layout
        
        // 검색 textField
        searchBar.setupLeftSideImage(ImageViewNamed: "icon_searchBar")
        
        searchBar.delegate = self
        
        // 최근 검색어 버튼 border
//        recentSearchButtonView?.layer.borderColor = UIColor.systemGray6.cgColor
//        recentSearchButtonView?.layer.borderWidth = 1
//        recentSearchButtonView?.layer.cornerRadius = 16
        getSearchDatas = [getRecentSearchKeywords()]
        
        print("데이터 가져오기 \(getSearchDatas)")
        
//        if getSearchDatas.isEmpty {
//            self.recentSearchButtonText?.text = ""
//        } else {
//            self.recentSearchButtonText.text = getSearchDatas[0]
//        }
    }
    
    // UITextFieldDelegate 메소드 - 사용자가 'Return' 또는 'Search' 버튼을 눌렀을 때 호출됨
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 키보드 숨기기
        performSearch() // 검색 액션 실행
        return true
    }
    
    // 실제 검색 동작을 수행하는 메소드
    func performSearch() {
        if let keyword = searchBar.text {
            // 여기서 검색 동작을 수행
            print("Searching for: \(keyword)")
            saveRecentSearchKeyword(keyword)
            print("Save: \(keyword)")
        }
    }
    
    func saveRecentSearchKeyword(_ keyword: String) {
        var recentKeywords = UserDefaults.standard.stringArray(forKey: "RecentSearchKeywords") ?? []
        
        // 이미 저장된 검색어라면 중복 제거
        if let index = recentKeywords.firstIndex(of: keyword) {
            recentKeywords.remove(at: index)
        }
        
        // 새로운 검색어 추가
        recentKeywords.insert(keyword, at: 0)
        
        // 최근 검색어 목록을 UserDefaults에 저장
        UserDefaults.standard.set(recentKeywords, forKey: "RecentSearchKeywords")
        print("현재까지 저장된 \(recentKeywords)")
    }
    
    
    func getRecentSearchKeywords() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "RecentSearchKeywords") ?? []
    }
    
    func clearRecentSearchKeywords() {
        UserDefaults.standard.removeObject(forKey: "RecentSearchKeywords")
    }
    
    @IBAction func recentSearchDeleteButton(_ sender: Any) {
        clearRecentSearchKeywords()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getSearchDatas[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentSearchCollectionViewCell",
                                                            for: indexPath) as? RecentSearchCollectionViewCell else {
            return RecentSearchCollectionViewCell()
        }
        
        cell.recentSearchText.text = getSearchDatas[indexPath.section][indexPath.row]
        
        cell.recentSearchText.preferredMaxLayoutWidth = collectionView.frame.width - 16

        cell.deleteButton.row = indexPath.row
        cell.deleteButton.section = indexPath.section
        cell.deleteButton.addTarget(self, action:#selector(deleteTapped(_:)), for: .touchUpInside)

//        if selected.contains(getSearchDatas[indexPath.section]) {
//            cell.backgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
//        } else {
//            cell.backgroundColor = .lightGray
//        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? RecentSearchCollectionViewCell, let text = cell.recentSearchText.text else {return}
        
        if selected.contains(text) {
            selected = selected.filter{$0 != text}
        } else {
            selected.append(text)
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 30)
    }
    
    
    
    
    @IBAction func kakaoButtonPressed(_ sender: Any) {
        // 카카오 버튼 클릭
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultViewController else { return }
        nextVC.search_text = "카카오"
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

// 검색 textField 좌측 아이콘 추가
extension UITextField {
    func setupLeftSideImage(ImageViewNamed: String){
        let imageView = UIImageView(frame: CGRect(x: 12, y: 12, width: 16, height: 16))
        imageView.image = UIImage(named: ImageViewNamed)
        let imageViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 42))
        imageViewContainer.addSubview(imageView)
        leftView = imageViewContainer
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}


extension SearchViewController {
    @objc func deleteTapped(_ sender: CustomButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        guard let cell = collectionView.cellForItem(at: indexPath) as? RecentSearchCollectionViewCell, let text = cell.recentSearchText.text else {return}
        selected = selected.filter{$0 != text}
        getSearchDatas[indexPath.section].remove(at: indexPath.row)
        collectionView.reloadData()
    }
}
