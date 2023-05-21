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
