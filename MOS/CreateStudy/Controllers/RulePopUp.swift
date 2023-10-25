//
//  RulePopUpVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/25.
//

import UIKit

class RulePopUp: UIView {
    
    @IBOutlet weak var sixthRuleCheckBox: UIImageView!
    @IBOutlet weak var fifthRuleCheckBox: UIImageView!
    @IBOutlet weak var fourthRuleCheckBox: UIImageView!
    @IBOutlet weak var thirdRuleCheckBox: UIImageView!
    @IBOutlet weak var secondRuleCheckBox: UIImageView!
    @IBOutlet weak var firstRuleCheckBox: UIImageView!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var firstRuleView: UIView!
    @IBOutlet weak var secondRuleView: UIView!
    @IBOutlet weak var thirdRuleView: UIView!
    @IBOutlet weak var fourthRuleView: UIView!
    @IBOutlet weak var fifthRuleView: UIView!
    @IBOutlet weak var sixthRuleView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    
    // 이전에 선택한 뷰를 추적하기 위한 변수
    public var selectedViews: [UIView] = []

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))

        rootView.layer.cornerRadius = 16

        setupView(firstRuleView, with: firstRuleCheckBox)
        setupView(secondRuleView, with: secondRuleCheckBox)
        setupView(thirdRuleView, with: thirdRuleCheckBox)
        setupView(fourthRuleView, with: fourthRuleCheckBox)
        setupView(fifthRuleView, with: fifthRuleCheckBox)
        setupView(sixthRuleView, with: sixthRuleCheckBox)

        // 각 뷰에 탭 제스처 추가
        addTapGesture(to: firstRuleView, with: firstRuleCheckBox, index: 0)
        addTapGesture(to: secondRuleView, with: secondRuleCheckBox, index: 1)
        addTapGesture(to: thirdRuleView, with: thirdRuleCheckBox, index: 2)
        addTapGesture(to: fourthRuleView, with: fourthRuleCheckBox, index: 3)
        addTapGesture(to: fifthRuleView, with: fifthRuleCheckBox, index: 4)
        addTapGesture(to: sixthRuleView, with: sixthRuleCheckBox, index: 5)
    }

    func addTapGesture(to view: UIView, with checkBox: UIImageView, index: Int) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.tag = index
        checkBox.tag = view.tag
        checkBox.image = UIImage(named: "createStudy_unclicked") // 초기 이미지 설정
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
            if let tappedView = sender.view {
            if let checkBox = tappedView.subviews.compactMap({ $0 as? UIImageView }).first {
                if checkBox.image == UIImage(named: "createStudy_clicked") {
                    // 이미 선택된 경우 원래 스타일과 이미지로 복구
                    tappedView.layer.borderColor = UIColor(hex: "EDEDED").cgColor
                    tappedView.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
                    checkBox.image = UIImage(named: "createStudy_unclicked")
                    selectedViews.remove(object: tappedView)
                } else {
                    // 선택되지 않은 경우 스타일 및 이미지 변경
                    tappedView.layer.borderColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
                    tappedView.layer.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
                    checkBox.image = UIImage(named: "createStudy_clicked")
                    selectedViews.append(tappedView)
                }
            }
        }
    }
                                                
    func setupView(_ view: UIView, with checkBox: UIImageView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
        checkBox.image = UIImage(named: "createStudy_unclicked")
    }
    
    func xibSetup(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "RulePopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
}

// 배열에서 특정 객체 제거하는 확장 함수
extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}


