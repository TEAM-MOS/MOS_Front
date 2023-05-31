//
//  StudyInputView.swift
//  MOS
//
//  Created by 김지은 on 2023/05/28.
//

import Foundation
import UIKit

class StudyInputView: UIView{
    
    @IBOutlet var studyInputView: UIView!
    @IBOutlet var categoryView: UIView!
    @IBOutlet var memberView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var locationView: UIView!
    @IBOutlet weak var leaderImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    
    
    @IBInspectable
    var title: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel.text = self.title
            }
        }
    }
    
    @IBInspectable
    var location: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.locationLabel.text = self.location
            }
        }
    }
    
    @IBInspectable
    var date: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.dateLabel.text = self.date
            }
        }
    }
    
    @IBInspectable
    var member: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.memberLabel.text = self.member
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
        self.memberView.layer.cornerRadius = 4
        self.dateView.layer.cornerRadius = 4
        self.locationView.layer.cornerRadius = 4
        self.categoryView.layer.cornerRadius = 12
        self.studyInputView.layer.cornerRadius = 16
        self.studyInputView.layer.shadowColor = UIColor.gray.cgColor //색상
        self.studyInputView.layer.shadowOpacity = 0.1 //alpha값
        self.studyInputView.layer.shadowRadius = 10 //반경
        self.studyInputView.layer.shadowOffset = CGSize(width: 0, height: 0) //위치조정
        self.studyInputView.layer.masksToBounds = false
        self.leaderImage.layer.cornerRadius = self.leaderImage.frame.size.width / 2
        self.leaderImage.clipsToBounds = true
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
