//
//  PagingViewController.swift
//  MOS
//
//  Created by 김지은 on 2023/06/20.
//

import UIKit
import LZViewPager

class PagingViewController: UIViewController, LZViewPagerDelegate, LZViewPagerDataSource {
    
    
    //MARK: - Outlets
    @IBOutlet weak var viewPager: LZViewPager!
    
    @IBOutlet weak var backBtn: UIImageView!
    
    //MARK: - Variables
    private var subControllers: [UIViewController] = []
    var selectedPageIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPagerProperties()
        navigationController?.navigationBar.isHidden = true
        
        
        backBtn.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        backBtn.addGestureRecognizer(tapGesture)
        
        viewPager.select(index: selectedPageIndex, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Properties
    func viewPagerProperties() {
        viewPager.delegate = self
        viewPager.dataSource = self
        viewPager.hostController = self
        
        let vc1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AllViewController") as! AllViewController
        
        let vc2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AnalysisViewController") as! AnalysisViewController
        
        let vc3 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "currentEventViewController") as! currentEventViewController
        
        let vc4 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PersonnelAptitudeViewController") as! PersonnelAptitudeViewController
        
        let vc5 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SelfIntroductionViewController") as! SelfIntroductionViewController
        
        let vc6 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "InterviewViewController") as! InterviewViewController
        
        let vc7 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "LanguageViewController") as! LanguageViewController
        
        vc1.title = "전체"
        vc2.title = "산업•기업 분석"
        vc3.title = "시사 PT"
        vc4.title = "인•적성"
        vc5.title = "자소서"
        vc6.title = "면접"
        vc7.title = "어학"
        
        subControllers = [vc1,vc2,vc3,vc4,vc5,vc6,vc7]
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "pretendard-Medium", size: 14)
        button.backgroundColor = UIColor.white
        return button
    }
    
    func shouldEnableSwipeable() -> Bool{
        return true
    }
    
    func colorForIndicator(at index: Int) -> UIColor{
        return UIColor.black
    }
    
    func widthForButton(at index: Int) -> CGFloat {
        let titles = ["전체","산업•기업 분석","시사 PT","인•적성","자소서","면접","어학"]
        
        let button = UIButton()
        button.setTitle(titles[index], for: .normal)
        button.sizeToFit()
        
        return button.frame.width + 20
    }
    
    func leftMarginForHeader() -> CGFloat{
        return 20
    }
    
    func rightMarginForHeader() -> CGFloat{
        return 20
    }
    
    @objc func imageTapped() {
        guard let navigationControllers = self.navigationController?.viewControllers else { return }
        for viewController in navigationControllers {
            if let previousVC = viewController as? HomeViewController {
                self.navigationController?.popToViewController(previousVC, animated: false)
                break
            }
        }
        
    }
}
