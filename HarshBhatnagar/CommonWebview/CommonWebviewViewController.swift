//
//  CommonWebviewViewController.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 12/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit
import WebKit

class CommonWebviewViewController: UIViewController {
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var comanWebView: WKWebView!
    @IBOutlet weak var lableNavigationTitle: UILabel!
    
    var titleStr = ""
    var urlStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lableNavigationTitle.text = titleStr
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        comanWebView.load(request)

        
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent;
    }
    
}
