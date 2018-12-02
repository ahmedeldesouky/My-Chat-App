//
//  AuthService.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/14/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToke: String {
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
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func loginUser (email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Header).responseJSON {
            
            response in
            if response.result.error == nil
            {
                guard let result = response.result.value else { return }
                let swiftyJSON = JSON(result)
                
                self.userEmail = swiftyJSON["user"].stringValue
                self.authToke = swiftyJSON["token"].stringValue
                
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
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Bearer_Header).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                SetUserInfo(data: data)
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    

    func findUserByEmail(completion: @escaping CompletionHandler) {
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(USER_EMAIL)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Bearer_Header).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                SetUserInfo(data: data)
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

func SetUserInfo(data: Data) {
    
    let swiftyJSON = JSON(data)
    let id = swiftyJSON["_id"].stringValue
    let color = swiftyJSON["avatarColor"].stringValue
    let avatarName = swiftyJSON["avatarName"].stringValue
    let email = swiftyJSON["email"].stringValue
    let name = swiftyJSON["name"].stringValue
    
    //Initialization of immutable value
    UserDataService.inistance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
}
