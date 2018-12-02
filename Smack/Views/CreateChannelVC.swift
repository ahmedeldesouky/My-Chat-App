//
//  CreateChannelVC.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/21/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit

class CreateChannelVC: UIViewController {
    
    
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var DesripTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                SetUpView()
            }

    @IBAction func ClosedBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreatChnlBtn(_ sender: Any) {
        guard let channelName = nameTxt.text , nameTxt.text != "" else { return }
        guard let channelDesc = DesripTxt.text , DesripTxt.text != "" else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func SetUpView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(CreateChannelVC.ClosedBtn(_:)))
        BgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : SmackPurplePlaceholder])
                DesripTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : SmackPurplePlaceholder])
    }
    
   @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
