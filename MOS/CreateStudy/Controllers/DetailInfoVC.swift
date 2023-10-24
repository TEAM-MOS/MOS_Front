//
//  DetailInfoVC.swift
//  MOS
//
//  Created by 김지은 on 2023/10/25.
//

import UIKit

class DetsilInfoVC: UIViewController {

    @IBOutlet weak var sunLabel: UILabel!
    @IBOutlet weak var satLabel: UILabel!
    @IBOutlet weak var FriLabel: UILabel!
    @IBOutlet weak var thursLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    @IBOutlet weak var TueLabel: UILabel!
    @IBOutlet weak var MonLabel: UILabel!
    @IBOutlet weak var sunView: UIView!
    @IBOutlet weak var satView: UIView!
    @IBOutlet weak var friView: UIView!
    @IBOutlet weak var thursView: UIView!
    @IBOutlet weak var wedView: UIView!
    @IBOutlet weak var TueView: UIView!
    @IBOutlet weak var MonView: UIView!
    
    // Dictionary to store the tap count for each view
    var tapCount: [UIView: Int] = [:]
    
    // Array to store selected days
    var studyDayEntities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView(sunView)
        setupView(satView)
        setupView(friView)
        setupView(thursView)
        setupView(wedView)
        setupView(TueView)
        setupView(MonView)
        
        // Add tap gesture recognizers to views
        addTapGestureToView(sunView, day: "SUN")
        addTapGestureToView(satView, day: "SAT")
        addTapGestureToView(friView, day: "FRI")
        addTapGestureToView(thursView, day: "THURS")
        addTapGestureToView(wedView, day: "WED")
        addTapGestureToView(TueView, day: "TUE")
        addTapGestureToView(MonView, day: "MON")
    }

    func setupView(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor(hex: "FFFFFF").cgColor
        view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
        
        // Initialize the tap count for each view to 0
        tapCount[view] = 0
    }
    
    func addTapGestureToView(_ view: UIView, day: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        
        // Store the corresponding day when adding the gesture recognizer
        view.accessibilityIdentifier = day
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        if let view = gesture.view, let day = view.accessibilityIdentifier {
            if let count = tapCount[view] {
                if count % 2 == 0 {
                    // On even taps, change the colors
                    view.backgroundColor = UIColor(hex: "FF5454")
                    view.layer.borderColor = UIColor(hex: "FECFC4").cgColor
                    // Change the label text color to white
                    changeLabelTextColor(labelForView(view), color: .white)
                    // Add the day to studyDayEntities
                    studyDayEntities.append(day)
                } else {
                    // On odd taps, revert to the original colors
                    view.backgroundColor = UIColor(hex: "FFFFFF")
                    view.layer.borderColor = UIColor(hex: "EDEDED").cgColor
                    // Change the label text color to black
                    changeLabelTextColor(labelForView(view), color: .black)
                    // Remove the day from studyDayEntities
                    if let index = studyDayEntities.firstIndex(of: day) {
                        studyDayEntities.remove(at: index)
                    }
                }
                // Increment the tap count for the view
                tapCount[view] = count + 1
            }
        }
    }
    
    func changeLabelTextColor(_ label: UILabel?, color: UIColor) {
        label?.textColor = color
    }
    
    func labelForView(_ view: UIView) -> UILabel? {
        // Map views to labels as per your naming convention
        switch view {
        case sunView: return sunLabel
        case satView: return satLabel
        case friView: return FriLabel
        case thursView: return thursLabel
        case wedView: return wedLabel
        case TueView: return TueLabel
        case MonView: return MonLabel
        default: return nil
        }
    }
}



