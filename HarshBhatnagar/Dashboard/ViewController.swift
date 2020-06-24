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


class ViewController: UIViewController,  ReturnDataFromDashboadCollectionProtocol{
   
    //MARK: - Variables
    
    let sideMenu = SideMenuViewController()
    var tableArray:[String] = []
    let dataModle = DataModal()
      
    //MARK: - IBOutlet
    @IBOutlet weak var billarView: UIView!
    @IBOutlet weak var tableOutlet: UITableView!

    
   
    
    //MARK: - IBAction

    @IBAction func didTapMenuBtn(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    
    //MARK: - func
    func fromcollectionView(Val: String) {
        print(Val)
    }
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
         
        self.billarView.isHidden = true

        tableArray = dataModle.dashboadTableArray()
    }
    func runSecretCode(){
        self.billarView.isHidden = true
    }
    
    @objc func setupSideMenu()
    {
   
        let storyBoard : UIStoryboard = UIStoryboard(name: str_Main, bundle:nil)
        let menuController = storyBoard.instantiateViewController(withIdentifier: str_SideMenuViewController) as! SideMenuViewController
         
        let menuNavigationController = UISideMenuNavigationController(rootViewController: menuController)
        menuNavigationController.isNavigationBarHidden = true
        SideMenuManager.default.menuLeftNavigationController = menuNavigationController
        SideMenuManager.default.menuRightNavigationController = nil
        SideMenuManager.default.menuWidth = self.view.frame.width - 100
        SideMenuManager.default.menuFadeStatusBar = false
    
    }
    
}

//MARK: - TableView Delegate
extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120;
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return tableArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
           let cell = tableView.dequeueReusableCell(withIdentifier: str_DashboardTableViewCell) as! DashboardTableViewCell
           cell.indexing = indexPath.row
           cell.lblTableTitle.text = tableArray[indexPath.row]
           cell.collectionViewOutlet.reloadData()
           cell.delegate = self
           
           return cell
       }
    
}
