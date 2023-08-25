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

