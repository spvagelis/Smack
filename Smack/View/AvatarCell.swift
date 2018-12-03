//
//  AvatarCell.swift
//  Smack
//
//  Created by vagelis spirou on 03/12/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import UIKit

enum AvatarType {
    
    case dark
    case light
    
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        
        if type == AvatarType.dark {
            
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView() {
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }
    
    
}
