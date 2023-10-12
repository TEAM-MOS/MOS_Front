//
//  RegisterTodoController.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import Foundation
import UIKit

class RegisterTodoController: UIViewController{
    
    let todos = [
        Todo(title: "Make vanilla pudding."),
        Todo(title: "Put pudding in a mayo jar."),
        Todo(title: "Eat it in a public place."),
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTextFieldBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터 소스와 델리게이트를 설정
        tableView.dataSource = self
    }
}

extension RegisterTodoController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! CheckTableViewCell
        
        let todo = todos[indexPath.row]
        
        cell.set(title: todo.title, checked: todo.isComplete)
        
        return cell
    }
}

