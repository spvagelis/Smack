//
//  GradientView.swift
//  Smack
//
//  Created by vagelis spirou on 27/11/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2117647059, green: 0.2274509804, blue: 0.7803921569, alpha: 1) {
        
        didSet {
            
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3450980392, green: 0.7294117647, blue: 0.8117647059, alpha: 1) {
        
        didSet {
            
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
