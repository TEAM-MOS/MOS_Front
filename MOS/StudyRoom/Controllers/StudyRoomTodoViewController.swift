//
//  StudyRoomTodoViewController.swift
//  MOS
//
//  Created by yeonsu on 11/20/23.
//

import UIKit

struct Todos {
    var title: String
    var isComplete: Bool
    
    // Initializer with default values
    init(title: String = "", isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
}

class StudyRoomTodoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var goTodoButton: UIView!
    @IBOutlet weak var goTodoLabel: UILabel!
    @IBOutlet weak var todoPercentLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet var weekButton: [UIButton]!
    
    @IBOutlet weak var addCellBtn: UIButton!
    
    
    var isSelectedDay = true
    var selectedButtonTag: Int?
    var todos: [Todos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 56.0 // 원하는 높이로 변경
        setUI()
        
        tableView.dataSource = self
        // addCellBtn의 액션 설정
        addCellBtn.addTarget(self, action: #selector(addCell), for: .touchUpInside)
    }
    
    func setUI() {
        goTodoButton.layer.borderWidth = 2
        goTodoButton.layer.cornerRadius = 8
        goTodoButton.layer.borderColor = UIColor(named: "subColor")?.cgColor
        goTodoButton.backgroundColor = UIColor(named: "category-1")
        
        goTodoLabel.text = "다른 멤버의 TODO 보러가기"
        todoPercentLabel.text = "75%"
        weekLabel.text = "2023년 11월 4주차"
        
        hideKeyboard()
    }
    
    @IBAction func isSelectedButton(_ sender: UIButton) {
        
        if sender.tag == selectedButtonTag {
            isSelectedDay.toggle()
        } else {
            if let previousTag = selectedButtonTag,
               let previousButton = weekButton.first(where: { $0.tag == previousTag }) {
                previousButton.backgroundColor = UIColor.clear
                previousButton.layer.borderWidth = 0
            }
            
            isSelectedDay = true
            selectedButtonTag = sender.tag
        }
        let newBackgroundColor = isSelectedDay ? UIColor(named: "category-1") : .white
        let newBorderColor = isSelectedDay ? UIColor(named: "main")?.cgColor : UIColor(named: "inactive_button_bg")?.cgColor
        sender.backgroundColor = newBackgroundColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 8
        sender.layer.borderColor = newBorderColor
    }
    
}


extension StudyRoomTodoViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]
        
        cell.set(title: todo.title, checked: todo.isComplete)
        
        return cell
    }
}

extension StudyRoomTodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 해당 셀의 텍스트를 가져와서 셀의 높이를 계산
        let cellText = todos[indexPath.row].title
        let label = UILabel()
        label.text = cellText
        label.numberOfLines = 0 // 여러 줄의 텍스트 지원
        label.font = UIFont(name: "pretendard", size: 18)
        
        // 원하는 간격(8)을 추가하여 셀의 높이 계산
        let desiredSpacing: CGFloat = 48
        let labelHeight = label.sizeThatFits(CGSize(width: tableView.frame.width, height: .greatestFiniteMagnitude)).height
        let cellHeight = labelHeight + desiredSpacing
        
        
        return cellHeight
    }
    
}

extension StudyRoomTodoViewController: DeleteTodoTableViewCellDelegate {
    func didClickDeleteButton(_ cell: TodoTableViewCell, didDeleteBtneClicked: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        // 해당 indexPath에 해당하는 항목을 배열에서 제거
        todos.remove(at: indexPath.row)
        
        // 테이블 뷰에서 해당 셀을 삭제
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @objc func addCell() {
        // 새로운 할 일 항목 생성
        let newTodo = Todos(title: "")
        todos.append(newTodo)
        
        // 테이블 뷰에 행을 추가하고 새로운 항목을 표시
        let indexPath = IndexPath(row: todos.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
