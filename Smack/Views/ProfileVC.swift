//
//  ProfileVC.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/20/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var UserLbl: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var backGView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    @IBAction func closedBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        UserDataService.inistance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
   
    func setUpView() {
        UserLbl.text = UserDataService.inistance.name
        userEmail.text = UserDataService.inistance.email
        profImg.image = UIImage(named: UserDataService.inistance.avatarName)
        profImg.backgroundColor = UserDataService.inistance.returnUIColor(components: UserDataService.inistance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_recognizer:)))
        backGView.addGestureRecognizer(closeTouch)
    }

    @objc func closeTap(_recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
