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
    static let list: [StudyList] = [ StudyList(category: "1", title: "1", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "1", title: "2", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4"), StudyList(category: "1", title: "3", imageName: "1", location: "송파구", date: "2/14(토)", member: "3/4") ]
    
}
