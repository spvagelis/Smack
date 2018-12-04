//
//  CircleImage.swift
//  Smack
//
//  Created by vagelis spirou on 04/12/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        setupView()
    }
    

}
