//
//  RoundedProgressView.swift
//  MOS
//
//  Created by 김지은 on 2023/08/25.
//

import Foundation
import UIKit

class RoundedProgressView: UIView {
    private let progressBarLayer = CAShapeLayer()
    public var progressTintColor: UIColor = .blue {
        didSet {
            progressBarLayer.fillColor = progressTintColor.cgColor
        }
    }
    private let trackTintColor: UIColor = .lightGray
    
    var progress: Float = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Create a rounded rectangle path for the track
        let trackPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height / 2.0)
        
        // Create a rounded rectangle path for the progress
        let progressWidth = bounds.width * CGFloat(progress)
        let progressPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: progressWidth, height: bounds.height), cornerRadius: bounds.height / 2.0)
        
        // Set the path for the progress bar layer
        progressBarLayer.path = progressPath.cgPath
        
        // Set the fill color for the progress bar
        if progress < 0.6 {
            progressBarLayer.fillColor = UIColor(named: "gray-2")?.cgColor
        } else {
            progressBarLayer.fillColor = UIColor(named: "main")?.cgColor
        }
        
        // Add the progress bar layer to the view's layer
        layer.addSublayer(progressBarLayer)
        
        // Create a track layer to represent the background
        let trackLayer = CAShapeLayer()
        trackLayer.path = trackPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        
        // Add the track layer below the progress bar layer
        layer.insertSublayer(trackLayer, below: progressBarLayer)
    }
}

