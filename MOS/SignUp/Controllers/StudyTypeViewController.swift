//
//  StudyTypeViewController.swift
//  MOS
//
//  Created by yeonsu on 11/10/23.
//

import UIKit

protocol SendUpdateDelegate {
    func sendUpdate(studyType: [String])
    
}

class StudyTypeViewController: UIViewController {
    
    var delegate: SendUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.sendUpdate(studyType: selectedButtonText)
    }
    
    let maxSelectedButtons = 2
    var selectedButtons: [UIButton] = []
    var selectedButtonText: [String] = []
    
    @IBAction func tagButtonDidTapped(_ sender: UIButton) {
        
        if selectedButtons.contains(sender) {
            deselectButton(sender)
        } else {
            if selectedButtons.count >= maxSelectedButtons {
                if let buttonToDeselect = selectedButtons.first {
                    deselectButton(buttonToDeselect)
                }
            }
            selectButton(sender)
        }
    }
    
    func selectButton(_ button: UIButton) {
        button.isSelected = true
        selectedButtons.append(button)
        selectedButtonText.append(button.title(for: .normal) ?? "")
        button.backgroundColor = UIColor(hex: "F9F9F9")
        button.layer.cornerRadius = 8
    }
    
    func deselectButton(_ button: UIButton) {
        button.isSelected = false
        if let index = selectedButtons.firstIndex(of: button) {
            selectedButtons.remove(at: index)
        }
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 8
    }
    
    @IBAction func completeButtonDidTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        print(selectedButtonText)
        
        
    }
}
