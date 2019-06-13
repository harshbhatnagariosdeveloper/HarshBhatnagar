//
//  ConstantSwift.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 12/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import Foundation

import UIKit

class ConstantSwift
{
    
    static let screenSize = UIScreen.main.bounds.size
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let UserDefault = UserDefaults.standard
    static let Syncronize = UserDefault.synchronize()
    
    //    static let userDefaults.set(value, forKey: keyname)
    //
    //    struct UserDefault
    //    {
    //        static let UserDefaults.standard.set(value, forKey: keyname) //Bool
    //
    //    }
    
    
    struct Colors
    {
        static let NavigationColorCRMLeft = UIColor(red: 45.0/255.0, green: 38.0/255.0, blue: 111.0/255.0, alpha: 1)
        static let NavigationColorCRMRight = UIColor(red: 93.0/255.0, green: 25.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        //        static let ProfileColorCRMLeft  = UIColor(red: 253, green: 15, blue: 119, alpha: 1)
        //        static let ProfileColorCRMRight  = UIColor(red: 97, green: 37, blue: 138, alpha: 1)
        
        static let ProfileColorCRMLeft = UIColor(red: 97.0/255.0, green: 37.0/255.0, blue: 138.0/255.0, alpha: 1)
        static let ProfileColorCRMRight = UIColor(red: 253.0/255.0, green: 15.0/255.0, blue: 119.0/255.0, alpha: 1)
        
    }
    
    static func getGradientView(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = view.bounds
        return gradientLayer
    }
    
    
    struct Device {
        // iDevice detection code
        static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
        static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_RETINA           = UIScreen.main.scale >= 2.0
        static let SCREEN_WIDTH        = Int(UIScreen.main.bounds.size.width)
        static let SCREEN_HEIGHT       = Int(UIScreen.main.bounds.size.height)
        static let SCREEN_MAX_LENGTH   = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
        static let SCREEN_MIN_LENGTH   = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
        static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
        static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
        static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
        static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
        static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    }
    
}
