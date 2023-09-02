//
//  RoundedProgressView.swift
//  MOS
//
//  Created by 김지은 on 2023/08/25.
//

import Foundation
import UIKit

class RoundedProgressView: UIView {
    private var progressLayer: CAShapeLayer!
    private var progressColor: UIColor = .gray
    
    var progress: Float = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var progressTintColor: UIColor {
        get {
            return progressColor
        }
        set {
            progressColor = newValue
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if progressLayer == nil {
            progressLayer = CAShapeLayer()
            layer.addSublayer(progressLayer)
        }
        
        let progressBarPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height / 2.0)
        let progressWidth = bounds.width * CGFloat(progress)
        let progressPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: progressWidth, height: bounds.height), cornerRadius: bounds.height / 2.0)
        
        progressLayer.path = progressBarPath.cgPath
        progressLayer.fillColor = progressColor.cgColor
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = progressPath.cgPath
        progressLayer.mask = maskLayer
    }
    
    // Add a method to set the progress
    func setProgress(_ value: Float) {
        progress = value
    }
}

