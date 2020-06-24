//
//  AppExtension.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 24/06/20.
//  Copyright © 2020 SSH. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
 
func getWidthForUIlabel() -> CGFloat {
       var width: CGFloat? = nil
       if let font = self.font {
           width = self.text?.size(withAttributes: [
           NSAttributedString.Key.font: font
       ]).width ?? 0.0
       }
       return width ?? 0.0
   }
   
   func getHeightForUIlabel() -> CGFloat {
       var attributedText: NSAttributedString? = nil
       if let font = self.font {
           attributedText = NSAttributedString(string: self.text ?? "", attributes: [
           NSAttributedString.Key.font: font
       ])
       }
     let lblFrame:CGSize = CGSize(width: (self.frame.width), height: CGFloat(MAXFLOAT))
       let rect = attributedText?.boundingRect(with: lblFrame, options: .usesLineFragmentOrigin, context: nil)
       return (rect?.size.height ?? 0.0) + 2
   }
}


@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }

}
