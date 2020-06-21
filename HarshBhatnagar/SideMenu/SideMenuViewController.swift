//
//  SideMenuViewController.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
//["key": " " ,"value": " " ]
    
    @objc let screenSize = UIScreen.main.bounds
    @objc let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @objc var newTable_Array : [[String:Any]] = [["key": "Github Repository" ,"value": "https://github.com/harshbhatnagariosdeveloper/HarshBhatnagar" ],["key": "Facebook" ,"value": "https://www.facebook.com/harshbhatnagar2008" ],["key": "Linkedin" ,"value": "http://linkedin.com/in/harsh-bhatnagar-966a61145" ],["key": "Instagram" ,"value": "https://www.instagram.com/invites/contact/?i=1w2m73o22jzds&utm_content=2lf2rt7"],["key": "Skype" ,"value": "https://join.skype.com/invite/myUYg0HwtGyX" ]]
    
    @IBOutlet weak var labelUserName: UILabel!

    @IBOutlet weak var labelAboutUser: UILabel!
    @IBOutlet weak var labelJobRole: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var imageBGView: CardView!
    @IBAction func uploadUserImage(_ sender: Any) {
    }
    @IBOutlet weak var tableBGview: UIView!
    @IBOutlet weak var tableOutlet: UITableView!
    
    //userNameHight aboutUserHight  jobRoleHight
    @IBOutlet weak var userNameHight: NSLayoutConstraint!
    @IBOutlet weak var jobRoleHight: NSLayoutConstraint!
    @IBOutlet weak var aboutUserHight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib1 = UINib(nibName: "Cell", bundle: nil)
//        tableOutlet.register(nib1, forCellReuseIdentifier: "Cell")
        tableOutlet.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableOutlet.estimatedRowHeight = 100
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.reloadData()
        changesInUI()

        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent;
    }
    
    @objc func changesInUI()  {
//        imageBGView.layer.cornerRadius = imageBGView.frame.width / 2
        imageBGView.layer.cornerRadius = 16.0//userImage.frame.width / 2
        userImage.layer.cornerRadius = 16.0//userImage.frame.width / 2
        
        labelUserName.text = "Harsh Bhatnagar"
        labelJobRole.text = "Senior Developer Mobile Solution L 1"
        labelAboutUser.text = "Working as a iOS Developer from February 2016."
        
        labelUserName.numberOfLines = 0
        labelJobRole.numberOfLines = 0
        labelAboutUser.numberOfLines = 0
        userNameHight.constant = labelUserName.getHeightForUIlabel() + 10
        aboutUserHight.constant = labelAboutUser.getHeightForUIlabel() + 10
        jobRoleHight.constant = labelJobRole.getHeightForUIlabel() + 10
        
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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        let dict :[String:Any] = newTable_Array[indexPath.row]
        let keyStr = dict["key"] as? String ?? ""
        let valueStr = dict["value"] as? String ?? ""
        let lbl = UILabel.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        lbl.numberOfLines = 0
        lbl.text =  valueStr
        let hight = lbl.getHeightForUIlabel()
        return hight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTable_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "Cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dict :[String:Any] = newTable_Array[indexPath.row]
        let keyStr = dict["key"] as? String ?? ""
        let valueStr = dict["value"] as? String ?? ""
        cell.textLabel?.text = keyStr
        cell.detailTextLabel?.text = valueStr
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let dict :[String:Any] = newTable_Array[indexPath.row]
        let keyStr = dict["key"] as? String ?? ""
        let valueStr = dict["value"] as? String ?? ""
        
        let commonWebview = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CommonWebviewViewController") as? CommonWebviewViewController
        commonWebview?.urlStr = valueStr
        commonWebview?.titleStr = keyStr
                
        self.navigationController?.pushViewController(commonWebview!, animated: true)
    }
}
