//
//  AuthService.swift
//  Smack
//
//  Created by vagelis spirou on 29/11/2018.
//  Copyright © 2018 vagelis spirou. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
        
    }
    
    var authToken: String {
        
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
//                if let json = response.result.value as? Dictionary<String, Any> {
//
//                    if let email = json["user"] as? String {
//
//                        self.userEmail = email
//                    }
//
//                    if let token = json["token"] as? String {
//
//                        self.authToken = token
//                    }
//
//                }
                
//                 SwiftyJSON
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                
                self.isLoggedIn = true
                completion(true)
                
            } else {
                
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
//        Εδω τοποθετούμε τις μεταβλητές που στέλνουμε ως http request για να κάνουμε προσθήκη του user. Κοιτάζουμε στο body του Add User(Postman).
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
//   Στο τι θα εμπεριέχει το header το βλέπουμε στο Postman, Add User -> Headers.
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                
//                Τραβάμε τα δεδομένα απο το JSON
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                
//        Δημιουργούμε τις μεταβλητές που πήραμε απο την απάντηση JSON (Κοιτάζουμε στο Postman Add User στο Body στην απαντηση json κατω μέρος και βλέπουμε ποιες μεταβλητές χρειαζόμαστε.)
                
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
       
//  Περνάμε τις μεταβλητές στην συναρτηση setUserData που δημιουργήσαμε στο UserDataService.swift
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                completion(true)
                
            } else {
                
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    
}
