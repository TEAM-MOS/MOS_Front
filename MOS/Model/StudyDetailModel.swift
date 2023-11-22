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
    static var list = StudyDetail(category: "산업&기업 분석", status: "모집중", createdDate: "2023-10-17T16:20:09.000+00:00", title: "2023 상반기 네이버 IT직군을 위한 심층 분석을 통한 산업&기업 분석 스터디", location: "송파구", startDate: "2023-12-01T16:20:09.000+00:00", endDate: "2024-01-27T16:20:09.000+00:00", currentmemberCount: 5, recruitMemberCount: 6, recruitStartPeriod: "10", recruitEndPeriod: "11", studyMode: "12", studyCreator: "13", studyDayWeek: "14", studyGoal: "15", studyRule: "⚠️ 지각비 안내\n미리 얘기하지 않고 지각할 경우 5분 당 500원씩 벌금을 걷고, 스터디 마지막날 팀원들끼리 나눠갖는 것으로 하겠습니다. 시간 꼭 잘 지켜주세요!\n\n💔 가입 전 주의사항\n 조기취업한 경우 제외하고 무단 이탈, 지각, 결석은 안 돼요! 가입 시 신중하게 고려해주세요. 스터디 진행 전 과제 준비는 필수입니다! 지각과 마찬가지로 금액을 정해서 벌금을 걷겠습니다~", studyIntroduction: "17", currentUserImg: "18", waitingUserImg: "19", studyTodoList: "20")
}
