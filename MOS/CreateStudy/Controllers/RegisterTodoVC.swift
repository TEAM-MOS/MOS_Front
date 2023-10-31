//
//  RegisterTodoController.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import Foundation
import UIKit

class RegisterTodoVC: UIViewController{
    
    var ResultModel: CreateStudyResultModel!
    
    //이전 화면에서 받아온 값
    var selectedCategory: Int?
    var studyTitleText: String?
    var studyMood: String?
    var postStartDate: String?
    var postEndDate: String?
    var maxMemberCount: Int = 4
    var isOnline: Bool = false
    var place: String?
    var onlinePlatform: Int?
    
    @IBOutlet weak var addCellBtn: UIButton!
    var todos = [
        Todo(title: "두근두근 첫 스터디 날!"),
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCellBtn.layer.borderWidth=1
        addCellBtn.layer.cornerRadius = 4
        addCellBtn.layer.borderColor = UIColor(named:"mainColor")?.cgColor
        
        // 데이터 소스와 델리게이트를 설정
        tableView.dataSource = self
        // addCellBtn의 액션 설정
        addCellBtn.addTarget(self, action: #selector(addCell), for: .touchUpInside)
    }
    
    @objc func addCell() {
           // 새로운 할 일 항목 생성
           let newTodo = Todo(title: "")
           todos.append(newTodo)
           
           // 테이블 뷰에 행을 추가하고 새로운 항목을 표시
           let indexPath = IndexPath(row: todos.count - 1, section: 0)
           tableView.insertRows(at: [indexPath], with: .automatic)
       }
}

extension RegisterTodoVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! CheckTableViewCell
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]
        
        cell.set(title: todo.title, checked: todo.isComplete)
        
        // 첫 번째 셀인 경우에만 삭제 버튼을 숨김
        cell.deleteBtn.isHidden = (indexPath.row == 0)
        
        return cell
    }
}

extension RegisterTodoVC: UITableViewDelegate {
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
        
        return 56
    }
    
}

extension RegisterTodoVC: DeleteTableViewCellDelegate {
    func didClickDeleteButton(_ cell: CheckTableViewCell, didDeleteBtneClicked: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        // 해당 indexPath에 해당하는 항목을 배열에서 제거
        todos.remove(at: indexPath.row)
        
        // 테이블 뷰에서 해당 셀을 삭제
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
//    @IBAction func nextButtonTapped(_ sender: UIButton) {
//        // API post
//        let parmeterData = RequestData(title: studyTitleText, goal: <#T##String#>, rules: <#T##String#>, quest: <#T##String#>, category: String, intro: <#T##String#>, maxMember: <#T##Int#>, mod: <#T##String#>, onOff: <#T##Bool#>, online: <#T##Int#>, startDate: <#T##String#>, endDate: <#T##String#>, studyDayEntities: <#T##[StudyDayEntity]#>)(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
//        
//        print(parmeterData)
//        
//        CreateStudyPost.instance.createStudyPosting(parameters: parmeterData) { result in
//            switch result {
//            case .success(let resultModel):
//                self.ResultModel = resultModel
//            case .failure(let error):
//                // Handle the error as needed
//                print("Error: \(error)")
//            }
//            
//            //        if let finishVC = storyboard?.instantiateViewController(withIdentifier: "FinishVC") as? FinishVC {
//            //            self.navigationController?.pushViewController(finishVC, animated: false)
//            //            }
//        }
//        
//    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        guard let navigationControllers = self.navigationController?.viewControllers else { return }
        for viewController in navigationControllers {
            if let previousVC = viewController as? DetailInfoVC {
                self.navigationController?.popToViewController(previousVC, animated: false)
                break
            }
        }
    }
}
    
