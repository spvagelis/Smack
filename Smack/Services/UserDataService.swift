//
//  UserDataService.swift
//  Smack
//
//  Created by vagelis spirou on 03/12/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
//    Δημιουργούμε τις μεταβλητές που θα δεχτούμε απο το request μεσω της JSON απάντησης.
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
//    Θα δημιουργήσουμε μια συναρτηση οπου θα κάνουμε set τις παραπάνω μεταβλητές
    
    func setUserData(id: String, color: String, avatarName: String,email: String, name: String) {
        
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
        
    }
    
    func setAvatarName(avatarName: String) {
        
        self.avatarName = avatarName
        
    }
    
}
