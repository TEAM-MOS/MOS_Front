//
//  StudyOutlineViewController.swift
//  MOS
//
//  Created by yeonsu on 2023/09/21.
//

import UIKit

class StudyOutlineViewController: UIViewController {
    
    @IBOutlet var outlineView: UIView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var category_bc: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var status_bc: UIView!
    @IBOutlet weak var createDate: UILabel!
    @IBOutlet weak var studyTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var startDate: UILabel!
    
    var yearTime: String = " "
    var monthTime1: Character = " "
    var monthTime2: Character = " "
    var dayTime1: Character = " "
    var dayTime2: Character = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        category.text = StudyDetail.list.category
        status.text = StudyDetail.list.status
        studyTitle.text = StudyDetail.list.title
        location.text = StudyDetail.list.location
        
        let studyStartDate = StudyDetail.list.startDate
        
        getDate(date: studyStartDate)
        startDate.text = "\(monthTime1)\(monthTime2)/\(dayTime1)\(dayTime2)"
        
        configure()
    }
    
    func configure() {
        if category.text == "산업&기업 분석" {
            category.textColor = UIColor(named: "label-category-1")
            category_bc.backgroundColor = UIColor(named: "category-1")
        } else if category.text == "인/적성" {
            category.textColor = UIColor(named: "label-category-3")
            category_bc.backgroundColor = UIColor(named: "category-3")
        } else if category.text == "어학" {
            category.textColor = UIColor(named: "label-category-6")
            category_bc.backgroundColor = UIColor(named: "category-6")
        } else if category.text == "면접" {
            category.textColor = UIColor(named: "label-category-5")
            category_bc.backgroundColor = UIColor(named: "category-5")
        } else if category.text == "시사 PT" {
            category.textColor = UIColor(named: "label-category-2")
            category_bc.backgroundColor = UIColor(named: "category-2")
        } else if category.text == "자소서" {
            category.textColor = UIColor(named: "label-category-4")
            category_bc.backgroundColor = UIColor(named: "category-4")
        }
        
        outlineView.layer.cornerRadius = 16
        outlineView.backgroundColor = .white
        
        category_bc.layer.cornerRadius = category_bc.frame.height / 2
        status_bc.layer.cornerRadius = status_bc.frame.height / 2
        
        if status.text == "모집마감" {
            statusImage.image = UIImage(named: "endCircle.png")
        }
        
        let createTime = StudyDetail.list.createdDate
        let yearTime = createTime.prefix(4)
        let monthTime1 = createTime[String.Index(encodedOffset: 5)]
        let monthTime2 = createTime[String.Index(encodedOffset: 6)]
        let dayTime1 = createTime[String.Index(encodedOffset: 8)]
        let dayTime2 = createTime[String.Index(encodedOffset: 9)]
        createDate.text = "\(yearTime).\(monthTime1)\(monthTime2).\(dayTime1)\(dayTime2)"
    }
    
    func getDate(date: String) {
        if date.count >= 4 {
            yearTime = String(date.prefix(4)) // 첫 4자리를 추출하여 yearTime에 할당
        } else {
            // date 문자열의 길이가 4자리보다 작을 때 예외 처리
            print("Invalid date format")
        }
        monthTime1 = date[String.Index(encodedOffset: 5)]
        monthTime2 = date[String.Index(encodedOffset: 6)]
        dayTime1 = date[String.Index(encodedOffset: 8)]
        dayTime2 = date[String.Index(encodedOffset: 9)]
    }
}

