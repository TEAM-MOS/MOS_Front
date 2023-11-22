//
//  PopUpActionViewController.swift
//  MOS
//
//  Created by yeonsu on 10/17/23.
//

import UIKit

protocol PopUpDelegate {
    func handleAction(action: Bool)
}

class PopUpActionViewController: UIViewController {
    
    static let identifier = "PopUpActionVC"
    var delegate: PopUpDelegate?
    
    
    //MARK: - outlets for the view controller
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    
    //MARK: - lifecyle methods for the view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPopUpStyle()
    }
    
    //MARK: - outlet functions for the viewController
    @IBAction func allowButtonDidTapped(_ sender: Any) {
        self.delegate?.handleAction(action: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    //MARK: - functions for the viewController
    func setPopUpStyle() {
        self.popUpView.layer.cornerRadius = 10
        self.allowButton.layer.cornerRadius = 10
        self.cancelButton.layer.cornerRadius = 10
        
        // .layerMaxXMaxYCorner: 우측 하단
        // .layerMinXMaxYCorner: 좌측 하단
        allowButton.layer.maskedCorners = [.layerMinXMaxYCorner]
        allowButton.layer.masksToBounds = true
        cancelButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cancelButton.layer.masksToBounds = true
        
    }
    
    static func showPopup(parentVC: UIViewController){
        if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "PopUpActionVC") as? PopUpActionViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            //setting the delegate of the dialog box to the parent viewController
            popupViewController.delegate = parentVC as? PopUpDelegate
            //presenting the pop up viewController from the parent viewController
            parentVC.present(popupViewController, animated: false)
        }
    }
}

