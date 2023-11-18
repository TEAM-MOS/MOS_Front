//
//  PopUp.swift
//  MOS
//
//  Created by 김지은 on 2023/11/19.
//

import UIKit

class PopUp: UIView {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    @IBOutlet weak var container3: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        bgView.layer.cornerRadius = 16
        container1.layer.cornerRadius = 8
        container2.layer.cornerRadius = 8
        container3.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.bounds.width / 2
        

    }
                    
    
    func xibSetup(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }

}
