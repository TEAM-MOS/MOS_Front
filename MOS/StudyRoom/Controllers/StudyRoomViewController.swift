//
//  StudyRoomViewController.swift
//  MOS
//
//  Created by yeonsu on 11/20/23.
//

import UIKit
import Tabman
import Pageboy

class StudyRoomViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    @IBOutlet weak var tempView: UIView! // 상단 탭바 들어갈 자리
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "산업&기업 분석"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor(named: "main")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let studyRoomTodoVC = UIStoryboard.init(name: "StudyRoom", bundle: nil).instantiateViewController(withIdentifier: "studyRoomTodoVC") as! StudyRoomTodoViewController
        let studyRoomInfoVC = UIStoryboard.init(name: "StudyRoom", bundle: nil).instantiateViewController(withIdentifier: "studyRoomInfoVC") as! StudyRoomInfoViewController
        
        viewControllers.append(studyRoomTodoVC)
        viewControllers.append(studyRoomInfoVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray // 선택 안되어 있을 때
            button.selectedTintColor = UIColor(named: "main") // 선택 되어 있을 때
        }
        // 인디케이터 조정
        bar.indicator.weight = .light
        bar.indicator.tintColor = UIColor(named: "main")
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 35 // 버튼 사이 간격
        
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
        
    }
}

extension StudyRoomViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        // MARK: - Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "홈")
        case 1:
            return TMBarItem(title: "Brand")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}
