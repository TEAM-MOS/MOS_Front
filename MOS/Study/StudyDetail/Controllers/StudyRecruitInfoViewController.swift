//
//  StudyRecruitInfoViewController.swift
//  MOS
//
//  Created by bonny kim on 2023/06/15.
//

import UIKit

class StudyRecruitInfoViewController: UIViewController{
    
    @IBOutlet var studyRecruitView: UIView!
    @IBOutlet weak var studyRecruitDate: UILabel!
    @IBOutlet weak var studyRecruitNum: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ModifyDate()
        
        studyRecruitView.layer.cornerRadius = 16
        studyRecruitNum.text = "\( StudyDetail.list.recruitMemberCount)명"
        
    }
    
    // ====== < 모집기간 날짜 설정 > ======
    func ModifyDate() {
        
        let startDate = StudyDetail.list.startDate
        let endDate = StudyDetail.list.endDate
        
        let startMonthTime1 = startDate[String.Index(encodedOffset: 5)]
        let startMonthTime2 = startDate[String.Index(encodedOffset: 6)]
        let startDayTime1 = startDate[String.Index(encodedOffset: 8)]
        let startDayTime2 = startDate[String.Index(encodedOffset: 9)]
        
        let startMonthTime3 = endDate[String.Index(encodedOffset: 5)]
        let startMonthTime4 = endDate[String.Index(encodedOffset: 6)]
        let startDayTime3 = endDate[String.Index(encodedOffset: 8)]
        let startDayTime4 = endDate[String.Index(encodedOffset: 9)]
        
        studyRecruitDate.text =  "\(startMonthTime1)\(startMonthTime2)월 \(startDayTime1)\(startDayTime2)일~\(startMonthTime3)\(startMonthTime4)월 \(startDayTime3)\(startDayTime4)일"
        
    }
}

