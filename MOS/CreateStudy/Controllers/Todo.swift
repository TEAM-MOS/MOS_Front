//
//  Todo.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import Foundation

struct Todo {
  let title: String
  let isComplete: Bool
  
  init(title: String, isComplete: Bool = false) {
    self.title = title
    self.isComplete = isComplete
  }
  
  func completeToggled() -> Todo {
    return Todo(title: title, isComplete: !isComplete)
  }
}
