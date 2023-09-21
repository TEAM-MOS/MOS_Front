//
//  StudyDetailModel.swift
//  MOS
//
//  Created by yeonsu on 2023/09/21.
//

import Foundation

struct StudyDetail {
    var category: String
    let status: String
    let createdDate: String
    let title: String
    let location: String
    let startDate: String
    let endDate: String
    let currentmemberCount: Int
    let recruitMemberCount: Int
    let recruitStartPeriod: String
    let recruitEndPeriod: String
    let studyMode: String
    let studyCreator: String
    let studyDayWeek: String
    let studyGoal: String
    let studyRule: String
    let studyIntroduction: String
    let currentUserImg: String?
    let waitingUserImg: String?
    let studyTodoList: String
}


extension StudyDetail {
    static var list = StudyDetail(category: "1", status: "2", createdDate: "3", title: "4", location: "5", startDate: "6", endDate: "7", currentmemberCount: 8, recruitMemberCount: 9, recruitStartPeriod: "10", recruitEndPeriod: "11", studyMode: "12", studyCreator: "13", studyDayWeek: "14", studyGoal: "15", studyRule: "16", studyIntroduction: "17", currentUserImg: "18", waitingUserImg: "19", studyTodoList: "20")
}
