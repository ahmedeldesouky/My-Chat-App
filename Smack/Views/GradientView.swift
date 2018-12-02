//
//  GradientView.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/8/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var fircol:UIColor=UIColor.clear{
        didSet{
            viecol()}
        
    }
    @IBInspectable var secol:UIColor=UIColor.clear{
        didSet{
            viecol()}
        
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [fircol.cgColor, secol.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    override class var layerClass:AnyClass {
        get{ return CAGradientLayer.self }
    }
    func viecol()  {
        let vie=self.layer as! CAGradientLayer
        vie.colors=[fircol.cgColor,secol.cgColor]
        
    }
}
