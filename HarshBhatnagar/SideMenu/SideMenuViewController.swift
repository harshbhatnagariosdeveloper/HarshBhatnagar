//
//  SideMenuViewController.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
   
    

    //MARK: - Variables
    @objc var newTable_Array : [String] = [Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie,Str_AddCategorie]
    
    //MARK: - IBOutlet
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var upperViewCH: NSLayoutConstraint!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserNameCH: NSLayoutConstraint!
    @IBOutlet weak var labelUserPossition: UILabel!
    @IBOutlet weak var labelUserPossitionCH: NSLayoutConstraint!
    @IBOutlet weak var labelUserContact: UILabel!
    @IBOutlet weak var labelUserContactCH: NSLayoutConstraint!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var imageBGView: UIView!
    @IBOutlet weak var tableBGview: UIView!
    @IBOutlet weak var tableOutlet: UITableView!
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOutlet.register(UITableViewCell.self, forCellReuseIdentifier: str_Cell)
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
        imageBGView.layer.cornerRadius = 8
        
        labelUserName.text = str_UserName
        labelUserNameCH.constant = 21
        
        labelUserPossition.text = str_UserProfile
        labelUserPossitionCH.constant =    labelUserPossition.getHeightForUIlabel() + 20
        
        labelUserContact.text = str_UserEmailID
        labelUserContactCH.constant =    labelUserContact.getHeightForUIlabel() + 20
        upperViewCH.constant = upperViewCH.constant + (labelUserPossitionCH.constant - 21) + (labelUserContactCH.constant - 21)

        imageBGView.clipsToBounds = true
        userImage.clipsToBounds = true
        imageBGView.layer.cornerRadius = 16
        userImage.layer.cornerRadius = 16
        
    }
    //MARK: - IBAction
    @IBAction func uploadUserImage(_ sender: Any) {
    }
    
    
}


extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTable_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: str_Cell, for: indexPath)
        cell.textLabel?.text = newTable_Array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
}
