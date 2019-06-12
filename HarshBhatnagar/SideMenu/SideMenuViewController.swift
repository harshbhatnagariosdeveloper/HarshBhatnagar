//
//  SideMenuViewController.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    
    @objc let screenSize = UIScreen.main.bounds
    @objc let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @objc var newTable_Array : Array<Any> = []
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var imageBGView: UIView!
    @IBAction func uploadUserImage(_ sender: Any) {
    }
    @IBOutlet weak var tableBGview: UIView!
    @IBOutlet weak var tableOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent;
    }
    
    @objc func changesInUI()  {
        imageBGView.layer.cornerRadius = 8
        
    }
    
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
