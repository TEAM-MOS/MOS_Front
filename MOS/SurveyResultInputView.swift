//
//  SurveyResultInputView.swift
//  MOS
//
//  Created by 김지은 on 2023/06/16.
//

import Foundation
import UIKit

class SurveyResultInputView: UIView{
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var InputView: UIView!
    @IBOutlet var titleView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var spaceBetweenScores
    : NSLayoutConstraint!
    
    @IBInspectable
       var score: String = "" {
           didSet{
               DispatchQueue.main.async {
                   self.scoreLabel.text = self.score
               }
           }
       }
    
    @IBInspectable
       var categoryName: String = "" {
           didSet{
               DispatchQueue.main.async {
                   self.categoryLabel.text = self.categoryName
               }
           }
       }
    
    
    @IBInspectable
       var progress: Float = 0 {
           didSet {
               DispatchQueue.main.async {
                   self.progressView.progress = self.progress
                   let progressWidth = self.progressView.frame.size.width * CGFloat(self.progress) // UIProgressView의 프로그레스에 해당하는 너비
                   let spacewidth = progressWidth - self.scoreLabel.frame.size.width - 18
                   self.spaceBetweenScores.constant = spacewidth
               }
           }
       }
    
    @IBInspectable
       var color: UIColor? {
           didSet {
               DispatchQueue.main.async {
                   self.progressView.progressTintColor = self.color
                   self.titleView.backgroundColor = self.color
               }
           }
       }
    
    @IBInspectable
       var labelcolor: UIColor? {
           didSet {
               DispatchQueue.main.async {
                   self.categoryLabel.textColor = self.labelcolor
               }
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func applyNib(){
        let nibName = String(describing: Self.self)
        let nib = Bundle.main.loadNibNamed(nibName, owner: self)
        guard let view = nib?.first as? UIView else{
            return
        }
        
        let cornerRadius: CGFloat = 8.0

        let maskLayer = CAShapeLayer()
        maskLayer.frame = titleView.bounds

        let maskPath = UIBezierPath(roundedRect: titleView.bounds,
                                    byRoundingCorners: [.topRight, .topLeft],
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))

        maskLayer.path = maskPath.cgPath
        titleView.layer.mask = maskLayer
        
        self.InputView.layer.cornerRadius = 8
        self.InputView.layer.shadowColor = UIColor.gray.cgColor //색상
        self.InputView.layer.shadowOpacity = 0.3 //alpha값
        self.InputView.layer.shadowRadius = 10 //반경
        self.InputView.layer.shadowOffset = CGSize(width: 0, height: 0) //위치조정
        self.InputView.layer.masksToBounds = false
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    
    }
    
    
}
