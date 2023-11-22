//
//  StudyInputView.swift
//  MOS
//
//  Created by 김지은 on 2023/05/31.
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
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBInspectable
    var image: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.leaderImage.image = UIImage(named:self.image)
            }
        }
    }
    
    
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
    
    @IBInspectable
    var category: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.categoryLabel.text = self.category
                
                switch self.category {
                          case "산업&기업 분석":
                              self.studyInputView.backgroundColor = UIColor(named: "category-1")
                              self.categoryLabel.textColor = UIColor(named: "label-category-1")
                          case "시사 PT":
                              self.studyInputView.backgroundColor = UIColor(named: "category-2")
                              self.categoryLabel.textColor = UIColor(named: "label-category-2")
                          case "인/적성":
                              self.studyInputView.backgroundColor = UIColor(named: "category-2")
                              self.categoryLabel.textColor = UIColor(named: "label-category-2")
                          case "자소서":
                              self.studyInputView.backgroundColor = UIColor(named: "category-4")
                              self.categoryLabel.textColor = UIColor(named: "label-category-4")
                          case "면접":
                              self.studyInputView.backgroundColor = UIColor(named: "category-5")
                              self.categoryLabel.textColor = UIColor(named: "label-category-5")
                          case "어학":
                              self.studyInputView.backgroundColor = UIColor(named: "category-3")
                              self.categoryLabel.textColor = UIColor(named: "label-category-3")
                          default:
                              // 기본 배경색을 설정하거나 다른 처리를 수행합니다.
                              self.categoryView.backgroundColor = UIColor.white
                          }
                
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
