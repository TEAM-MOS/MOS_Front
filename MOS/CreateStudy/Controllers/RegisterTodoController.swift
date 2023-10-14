//
//  RegisterTodoController.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import Foundation
import UIKit

class RegisterTodoController: UIViewController{
    
    var todos = [
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
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]
        
        cell.set(title: todo.title, checked: todo.isComplete)
        
        return cell
    }
}

extension RegisterTodoController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 해당 셀의 텍스트를 가져와서 셀의 높이를 계산
        let cellText = todos[indexPath.row].title
        let label = UILabel()
        label.text = cellText
        label.numberOfLines = 0 // 여러 줄의 텍스트 지원
        label.font = UIFont(name: "pretendard", size: 20)
        
        // 원하는 간격(8)을 추가하여 셀의 높이 계산
        let desiredSpacing: CGFloat = 32
        let labelHeight = label.sizeThatFits(CGSize(width: tableView.frame.width, height: .greatestFiniteMagnitude)).height
        let cellHeight = labelHeight + desiredSpacing
        
        return cellHeight
    }
}

extension RegisterTodoController: DeleteTableViewCellDelegate {
    func didClickDeleteButton(_ cell: CheckTableViewCell, didDeleteBtneClicked: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {
                    return
                }
                
                // 해당 indexPath에 해당하는 항목을 배열에서 제거
                todos.remove(at: indexPath.row)
                
                // 테이블 뷰에서 해당 셀을 삭제
                tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
