//
//  RegisterTodoController.swift
//  MOS
//
//  Created by 김지은 on 2023/10/12.
//

import Foundation
import UIKit

class RegisterTodoController: UIViewController{
    
    
    @IBOutlet weak var addTextFieldBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    var textFieldCount = 1 // 추가된 textField 수를 추적
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
        @IBAction func addTextFieldBtnTapped(_ sender: UIButton) {
            // 새로운 textField를 생성
            let newTextField = UITextField()

            // textFieldCount를 사용하여 각 textField를 12 포인트 아래로 이동
            let offset = CGFloat(textFieldCount) * 12.0
            let textFieldFrame = textField.frame
            newTextField.frame = CGRect(x: textFieldFrame.origin.x,
                                        y: textFieldFrame.origin.y + textFieldFrame.size.height + offset,
                                        width: textFieldFrame.size.width,
                                        height: textFieldFrame.size.height)

            // 테두리 스타일을 설정
            newTextField.borderStyle = .roundedRect
            newTextField.layer.borderColor = UIColor.gray.cgColor // 테두리 색상을 회색으로 설정
            newTextField.layer.borderWidth = 1.0 // 테두리 두께 설정

            // 화면에 새로운 textField를 추가
            view.addSubview(newTextField)

            // textFieldCount를 증가하여 다음 textField가 더 아래로 이동하도록 함
            textFieldCount += 1
        }


   }
