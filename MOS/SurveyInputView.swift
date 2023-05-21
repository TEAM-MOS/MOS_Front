//
//  SurveyInputView.swift
//  MOS
//
//  Created by 김지은 on 2023/05/21.
//

import Foundation
import UIKit

@IBDesignable
class SurveyInputView: UIView {
    
    @IBOutlet var questionNumBackground: UIView!
    
    @IBOutlet var questionNumLabel: UILabel!
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button2: UIButton!

    @IBOutlet weak var button1: UIButton!
    
    //인터페이스 빌더에서 속성 넣기
    @IBInspectable
    var title: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.questionLabel.text = self.title
            }
        }
    }
    
    @IBInspectable
    var containerborder: CGFloat = 0 {
        didSet {
            DispatchQueue.main.async {
                self.containerView.layer.borderWidth = self.containerborder
                self.containerView.layer.borderColor = UIColor(named: "gray-2")?.cgColor
                self.containerView.layer.cornerRadius = 10
            }
        }
    }
    
    @IBInspectable
    var buttonborder: CGFloat = 0 {
        didSet {
            DispatchQueue.main.async {
                self.button1.layer.cornerRadius = self.button1.frame.height/2
                self.button1.layer.borderWidth = self.containerborder
                self.button1.layer.borderColor = UIColor(named: "gray-2")?.cgColor
                self.button2.layer.cornerRadius = self.button1.frame.height/2
                self.button2.layer.borderWidth = self.containerborder
                self.button2.layer.borderColor = UIColor(named: "gray-2")?.cgColor
                self.button3.layer.cornerRadius = self.button1.frame.height/2
                self.button3.layer.borderWidth = self.containerborder
                self.button3.layer.borderColor = UIColor(named: "gray-2")?.cgColor
                self.button4.layer.cornerRadius = self.button1.frame.height/2
                self.button4.layer.borderWidth = self.containerborder
                self.button4.layer.borderColor = UIColor(named: "gray-2")?.cgColor
                self.button5.layer.cornerRadius = self.button5.frame.height/2
                self.button5.layer.borderWidth = self.containerborder
                self.button5.layer.borderColor = UIColor(named: "gray-2")?.cgColor
            }
        }
    }
    
    @IBInspectable
    var questionNum: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.questionNumBackground.layer.cornerRadius = self.questionNumBackground.frame.height/2
                self.questionNumLabel.text = self.questionNum
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        applyNib()
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID, #function, #line, "- ")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#fileID, #function, #line, "- ")
    }
    
    fileprivate func applyNib(){
        print(#fileID, #function, #line, "- ")
        let nibName = String(describing: Self.self)
        let nib = Bundle.main.loadNibNamed(nibName, owner: self)
        guard let view = nib?.first as? UIView else{
            return
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
}
