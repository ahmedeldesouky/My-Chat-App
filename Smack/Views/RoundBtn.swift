//
//  RoundBtn.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/15/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit
@IBDesignable
class RoundBtn: UIButton {
    
    @IBInspectable var cornerR: CGFloat = 0 {
        
        didSet {
            self.layer.cornerRadius = cornerR
        }
    }
}
