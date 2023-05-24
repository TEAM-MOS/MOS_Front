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
    
    @IBOutlet var button5Label: UILabel!
    @IBOutlet var button4Label: UILabel!
    @IBOutlet var button3Label: UILabel!
    @IBOutlet var button2Label: UILabel!
    @IBOutlet var button1Label: UILabel!
    
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
        applyAction()
        
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
    
    fileprivate func applyAction(){
        self.button1.addTarget(self, action: #selector(onBtn1Clicked(sender:)), for: .touchUpInside)
        self.button2.addTarget(self, action: #selector(onBtn2Clicked(sender:)), for: .touchUpInside)
        self.button3.addTarget(self, action: #selector(onBtn3Clicked(sender:)), for: .touchUpInside)
        self.button4.addTarget(self, action: #selector(onBtn4Clicked(sender:)), for: .touchUpInside)
        self.button5.addTarget(self, action: #selector(onBtn5Clicked(sender:)), for: .touchUpInside)
    }
    
    @objc func onBtn1Clicked(sender: UIButton){
        print(#fileID, #function, #line, "- btn1 clicked")
        self.button1.layer.borderColor = UIColor(named: "main")?.cgColor
        self.button1.layer.backgroundColor = UIColor(named: "main-2")?.cgColor
        self.button1Label.textColor = UIColor(named: "main")
        
        self.button3.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button3.layer.backgroundColor = UIColor.white.cgColor
        self.button3Label.textColor = UIColor.black
        self.button2.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button2.layer.backgroundColor = UIColor.white.cgColor
        self.button2Label.textColor = UIColor.black
        self.button4.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button4.layer.backgroundColor = UIColor.white.cgColor
        self.button4Label.textColor = UIColor.black
        self.button5.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button5.layer.backgroundColor = UIColor.white.cgColor
        self.button5Label.textColor = UIColor.black
        
    }
    @objc func onBtn2Clicked(sender: UIButton){
        print(#fileID, #function, #line, "- btn2 clicked")
        self.button2.layer.borderColor = UIColor(named: "main")?.cgColor
        self.button2.layer.backgroundColor = UIColor(named: "main-2")?.cgColor
        self.button2Label.textColor = UIColor(named: "main")
        
        self.button1.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button1.layer.backgroundColor = UIColor.white.cgColor
        self.button1Label.textColor = UIColor.black
        self.button3.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button3.layer.backgroundColor = UIColor.white.cgColor
        self.button3Label.textColor = UIColor.black
        self.button4.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button4.layer.backgroundColor = UIColor.white.cgColor
        self.button4Label.textColor = UIColor.black
        self.button5.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button5.layer.backgroundColor = UIColor.white.cgColor
        self.button5Label.textColor = UIColor.black
        
    }
    @objc func onBtn3Clicked(sender: UIButton){
        print(#fileID, #function, #line, "- btn3 clicked")
        self.button3.layer.borderColor = UIColor(named: "main")?.cgColor
        self.button3.layer.backgroundColor = UIColor(named: "main-2")?.cgColor
        self.button3Label.textColor = UIColor(named: "main")
        
        self.button1.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button1.layer.backgroundColor = UIColor.white.cgColor
        self.button1Label.textColor = UIColor.black
        self.button2.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button2.layer.backgroundColor = UIColor.white.cgColor
        self.button2Label.textColor = UIColor.black
        self.button4.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button4.layer.backgroundColor = UIColor.white.cgColor
        self.button4Label.textColor = UIColor.black
        self.button5.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button5.layer.backgroundColor = UIColor.white.cgColor
        self.button5Label.textColor = UIColor.black
    }
    @objc func onBtn4Clicked(sender: UIButton){
        print(#fileID, #function, #line, "- btn4 clicked")
        self.button4.layer.borderColor = UIColor(named: "main")?.cgColor
        self.button4.layer.backgroundColor = UIColor(named: "main-2")?.cgColor
        self.button4Label.textColor = UIColor(named: "main")
        
        self.button1.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button1.layer.backgroundColor = UIColor.white.cgColor
        self.button1Label.textColor = UIColor.black
        self.button2.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button2.layer.backgroundColor = UIColor.white.cgColor
        self.button2Label.textColor = UIColor.black
        self.button3.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button3.layer.backgroundColor = UIColor.white.cgColor
        self.button3Label.textColor = UIColor.black
        self.button5.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button5.layer.backgroundColor = UIColor.white.cgColor
        self.button5Label.textColor = UIColor.black
        
    }
    @objc func onBtn5Clicked(sender: UIButton){
        print(#fileID, #function, #line, "- btn5 clicked")
        self.button5.layer.borderColor = UIColor(named: "main")?.cgColor
        self.button5.layer.backgroundColor = UIColor(named: "main-2")?.cgColor
        self.button5Label.textColor = UIColor(named: "main")
        
        self.button1.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button1.layer.backgroundColor = UIColor.white.cgColor
        self.button1Label.textColor = UIColor.black
        self.button2.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button2.layer.backgroundColor = UIColor.white.cgColor
        self.button2Label.textColor = UIColor.black
        self.button4.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button4.layer.backgroundColor = UIColor.white.cgColor
        self.button4Label.textColor = UIColor.black
        self.button3.layer.borderColor = UIColor(named: "gray-1")?.cgColor
        self.button3.layer.backgroundColor = UIColor.white.cgColor
        self.button3Label.textColor = UIColor.black
        
    }
}
