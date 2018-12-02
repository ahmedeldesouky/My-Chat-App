//
//  LoginVC.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/8/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit
import Foundation

class LoginVC: UIViewController {
    
    @IBOutlet weak var UserTxt: UITextField!
    @IBOutlet weak var PassTxt: UITextField!
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpViwe()
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
    
        Spinner.isHidden = false
        Spinner.startAnimating()
        guard let userName = UserTxt.text , UserTxt.text != "" else { return }
        guard let password = PassTxt.text , PassTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: userName, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.Spinner.isHidden = true
                        self.Spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        
    }
    
    
    @IBAction func clossedBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toCreateBtn(_ sender: Any) {
        performSegue(withIdentifier: To_Create, sender: nil)
    }
    
    func SetUpViwe() {
        Spinner.isHidden = true
        UserTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: SmackPurplePlaceholder])
        
        PassTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: SmackPurplePlaceholder])
    }
    
}
