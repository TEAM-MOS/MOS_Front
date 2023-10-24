//
//  RulePopUpVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/25.
//

import UIKit

class RulePopUp: UIView {
    
    @IBOutlet weak var closeBtn: UIButton!
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x:0, y:0, width: frame.width, height: frame.height))
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
