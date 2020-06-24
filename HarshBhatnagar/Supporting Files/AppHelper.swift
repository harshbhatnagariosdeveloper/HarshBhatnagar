//
//  AppHelper.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 24/06/20.
//  Copyright © 2020 SSH. All rights reserved.
//

import Foundation
import UIKit

class AppHelper: NSObject {
 
    @objc func setCAGradientLayer(_ colorLeft1: UIColor?, colorRight colorRight1: UIColor?, yourView yourView1: UIView?) {
           let maskLayer2 = CAGradientLayer()
           maskLayer2.colors = [(colorRight1?.cgColor as? Any), (colorLeft1?.cgColor as? Any)]
           //        maskLayer2.colors = [colorRight1?.cgColor, colorLeft1?.cgColor]
           yourView1?.backgroundColor = UIColor.clear
           maskLayer2.frame = yourView1?.bounds ?? CGRect.zero
           yourView1?.layer.insertSublayer(maskLayer2, at: 0)
       }
       
    
    @objc func getGradientView(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = view.bounds
        return gradientLayer
    }
    
    
}


