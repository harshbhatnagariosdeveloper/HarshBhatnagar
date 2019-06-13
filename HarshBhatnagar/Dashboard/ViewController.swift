//
//  ViewController.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//
import LocalAuthentication
import UIKit
import SideMenu


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ReturnDataFromDashboadCollectionProtocol{
   
    let sideMenu = SideMenuViewController()
    func fromcollectionView(Val: String) {
        print(Val)
    }
    
    var tableArray:[String] = []
    let dataModle = DataModal()
    

    
    @IBAction func didTapMenuBtn(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var billarView: UIView!
    @IBOutlet weak var tableOutlet: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        billarView.addSubview(blurEffectView)
        
//        authenticateUser()
        self.billarView.isHidden = true

        tableArray = dataModle.dashboadTableArray()
    }
    func runSecretCode(){
        self.billarView.isHidden = true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //DashboardTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell") as! DashboardTableViewCell
        cell.indexing = indexPath.row
        cell.lblTableTitle.text = tableArray[indexPath.row]
        cell.collectionViewOutlet.reloadData()
        cell.delegate = self
        
        return cell
    }

//    func authenticateUser() {
//        let context = LAContext()
//        var error: NSError?
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "This is My Personal Data Base please Identify yourself!"
//
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
//                [unowned self] success, authenticationError in
//
//                DispatchQueue.main.async {
//                    if success {
//                        self.runSecretCode()
//                    } else {
//                        self.authenticateUser()
////                        let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
////                        ac.addAction(UIAlertAction(title: "OK", style: .default))
////                        self.present(ac, animated: true)
//                    }
//                }
//            }
//        } else {
//            authenticateUser()
////            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
////            ac.addAction(UIAlertAction(title: "OK", style: .default))
////            present(ac, animated: true)
//        }
//    }
    
   
    
    @objc func setupSideMenu()
    {
        //SideMenuViewController side
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let menuController = storyBoard.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
//        let menuController = SideMenuViewController(nibName : "SideMenuViewController", bundle : nil)
        let menuNavigationController = UISideMenuNavigationController(rootViewController: menuController)
        menuNavigationController.isNavigationBarHidden = true
        SideMenuManager.default.menuLeftNavigationController = menuNavigationController
        SideMenuManager.default.menuRightNavigationController = nil
        SideMenuManager.default.menuWidth = ConstantSwift.screenSize.width - 100
        SideMenuManager.default.menuFadeStatusBar = false

        
    }
    
    
}

