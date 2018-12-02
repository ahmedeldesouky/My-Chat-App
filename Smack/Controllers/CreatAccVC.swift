//
//  CreatAccVC.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/8/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit

class CreatAccVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.inistance.avatarName != "" {
            userAvatar.image = UIImage(named: UserDataService.inistance.avatarName)
            avatarName = UserDataService.inistance.avatarName
            
            //to load ligth avatars with lightGray Background
            if avatarName.contains("light") && bgColor == nil {
                userAvatar.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    
    @IBAction func createAccBtn(_ sender: Any) {
        Spinner.isHidden = false
        Spinner.startAnimating()
        
        guard let name = usernameTxt.text , usernameTxt.text != "" else {
            return
        }
        guard let email = emailTxt.text , emailTxt.text != "" else {
            return
        }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (succes) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
        if succes {
//        print(UserDataService.inistance.name, UserDataService.inistance.avatarName)
            self.Spinner.isHidden = true
            self.Spinner.stopAnimating()
            
        self.performSegue(withIdentifier: UnWind, sender: nil)
            
            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            
                            }
                        })
                    }
                })
            }
        }
        
    }
    
    @IBAction func chooseAvatarBtn(_ sender: Any) {
       performSegue(withIdentifier: To_Avatar_Picker, sender: nil)
    }
    
    @IBAction func generateBGcolorBtn(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.5){
        self.userAvatar.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func closedBtn(_ sender: Any) {
        performSegue(withIdentifier: UnWind, sender: nil)
    }
    
    func setupView() {
        Spinner.isHidden = true
        
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: SmackPurplePlaceholder])
        
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: SmackPurplePlaceholder])

        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: SmackPurplePlaceholder])

        //hide keyboard by tapped on any place
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreatAccVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

}
