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
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x:0, y:0, width: frame.width, height: frame.height))
        
        setupView(firstRuleView, with: firstRuleCheckBox)
        setupView(secondRuleView, with: secondRuleCheckBox)
        setupView(thirdRuleView, with: thirdRuleCheckBox)
        setupView(fourthRuleView, with: fourthRuleCheckBox)
        setupView(fifthRuleView, with: fifthRuleCheckBox)
        setupView(sixthRuleView, with: sixthRuleCheckBox)
        
        // 각 뷰에 탭 제스처 추가
        addTapGesture(to: firstRuleView, with: firstRuleCheckBox)
        addTapGesture(to: secondRuleView, with: secondRuleCheckBox)
        addTapGesture(to: thirdRuleView, with: thirdRuleCheckBox)
        addTapGesture(to: fourthRuleView, with: fourthRuleCheckBox)
        addTapGesture(to: fifthRuleView, with: fifthRuleCheckBox)
        addTapGesture(to: sixthRuleView, with: sixthRuleCheckBox)
    }
    
    func addTapGesture(to view: UIView, with checkBox: UIImageView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.tag = 0
        checkBox.tag = view.tag
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view, let mood = tappedView.accessibilityLabel {
            resetCheckBoxes()
            tappedView.layer.borderColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
            tappedView.layer.backgroundColor = UIColor(red: 255/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
            
            if let checkBox = tappedView.subviews.compactMap({ $0 as? UIImageView }).first {
                checkBox.image = UIImage(named: "createStudy_clicked")
            }
        }
    }
    
    func resetCheckBoxes() {
        for view in [firstRuleView, secondRuleView, thirdRuleView, fourthRuleView, fifthRuleView, sixthRuleView] {
            view?.layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1).cgColor
            view?.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        }
        
        for checkBox in [firstRuleCheckBox, secondRuleCheckBox, thirdRuleCheckBox, fourthRuleCheckBox,fifthRuleCheckBox, sixthRuleCheckBox] {
            checkBox?.image = UIImage(named: "createStudy_unclicked")
        }
    }
    
    func setupView(_ view: UIView, with checkBox: UIImageView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
        checkBox.image = UIImage(named: "createStudy_unclicked")
    }
    
    func xibSetup(frame: CGRect){
        let view = loadXib()
        view.frame=frame
        addSubview(view)
    }
    
    func loadXib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "RulePopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
}
