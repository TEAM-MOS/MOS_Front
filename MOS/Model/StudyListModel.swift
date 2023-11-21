//
//  StudyListModel.swift
//  MOS
//
//  Created by yeonsu on 2023/08/18.
//

import Foundation


struct StudyList {
    let category: String
    let title: String
    let imageName: String
    let location: String
    let date: String
    let member: String
}


extension StudyList {
    static let list: [StudyList] = [ StudyList(category: "산업&기업 분석", title: "2023년 상반기 네이버 IT직군 면접 준비 스터디원 모집합니다 :)", imageName: "ic_home_category1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "인/적성", title: "IBK기업은행 공채 준비하는 사람들 모임", imageName: "ic_home_star", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "오픽은 선택 아닌 필수인 스터디", imageName: "circle", location: "노원구", date: "3/2(월)", member: "3/6"), StudyList(category: "1", title: "3", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "1", title: "3", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4") ]
}

extension StudyList {
    static let listAll: [StudyList] = [ StudyList(category: "산업&기업 분석", title: "2023년 상반기 네이버 IT직군 면접 준비 스터디원 모집합니다 :)", imageName: "profile1", location: "송파구", date: "2/14(토)", member: "3/4"),StudyList(category: "시사 PT", title: "입사 면접의 첫인상, 시사PT로 만들다. 취업을 위한 시사 PT 한달만에 뽀개기", imageName: "profile5", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "인/적성", title: "IBK기업은행 공채 준비하는 사람들 모임", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "오픽은 선택 아닌 필수인 스터디", imageName: "profile3", location: "노원구", date: "3/2(월)", member: "3/6"), StudyList(category: "자소서", title: "취업을 위한 마음과 글의 여정: 자소서 스터디", imageName: "profile3", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "면접", title: "2023년 상반기 네이버 IT직군 면접 준비 스터디원 모집합니다 :)", imageName: "profile4", location: "송파구", date: "2/14(토)", member: "3/4") ]
}

extension StudyList {
    static let listAnalysis: [StudyList] = [ StudyList(category: "산업&기업 분석", title: "2023년 상반기 네이버 IT직군을 위한 심층 분석을 통한 산업&기업분석 스터디", imageName: "profile1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "산업&기업 분석", title: "산업의 흐름을 읽어라! 산업 기업 분석 스터디 참가자 모집", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"),StudyList(category: "산업&기업 분석", title: "전략적으로 성장하는 기업을 파헤치다! 산업 기업 분석 스터디 참가 신청하세요", imageName: "profile3", location: "동작구", date: "3/12(월)", member: "1/4"),StudyList(category: "산업&기업 분석", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"),StudyList(category: "산업&기업 분석", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"),StudyList(category: "산업&기업 분석", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}

extension StudyList {
    static let listCurrentEvent: [StudyList] = [ StudyList(category: "시사 PT", title: "2024년 하반기 대기업 입문을 목표로, 시사PT 마스터 클래스 함께해봐요 👨‍👨‍👧‍👧", imageName: "profile1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "시사 PT", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "시사 PT", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "시사 PT", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "시사 PT", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "시사 PT", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}

extension StudyList {
    static let listPersonnelAptitude: [StudyList] = [ StudyList(category: "인/적성", title: "2024년 하반기 대기업 입문을 목표로, 시사PT 마스터 클래스 함께해봐요 👨‍👨‍👧‍👧", imageName: "profile1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "인/적성", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "인/적성", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "인/적성", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "인/적성", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "인/적성", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}

extension StudyList {
    static let listInterview: [StudyList] = [ StudyList(category: "면접", title: "인적성 시험 대비 그룹참여자 구합니다.", imageName: "profile3", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "면접", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "면접", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "면접", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "면접", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "면접", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}


extension StudyList {
    static let listSelfIntroduce: [StudyList] = [ StudyList(category: "자소서", title: "인적성 시험 대비 그룹참여자 구합니다.", imageName: "profile3", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "자소서", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "자소서", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "자소서", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "자소서", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "자소서", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}

extension StudyList {
    static let listLanguage: [StudyList] = [ StudyList(category: "어학", title: "인적성 시험 대비 그룹참여자 구합니다.", imageName: "profile3", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "어학", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "취업을 위한 인사이트, 시사PT 스터디로 함께 나아가 봅시다!", imageName: "profile2", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "산업의 트렌드와 기업의 전략을 공부하는 스터디, 참여자를 모집합니다", imageName: "profile4", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "산업별 동향을 살피는 산업 기업 분석 스터디 참가자를 모집합니다", imageName: "profile5", location: "동작구", date: "3/12(월)", member: "1/4"), StudyList(category: "어학", title: "비즈니스 인사이트를 얻는 산업 기업 분석 스터디, 함께 할 동료를 찾습니다", imageName: "profile6", location: "동작구", date: "3/12(월)", member: "1/4") ]
}
