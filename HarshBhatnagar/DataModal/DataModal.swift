//
//  DataModal.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit


class DataModal: NSObject ,DashboadCollectionProtocol, DashboadTableProtocol{
   
    
    func dashboadTableArray() -> [String] {
        let tableArray:[String] = ["Home","Personal","Home","Personal","Home","Personal","Home","Personal"]
        return tableArray
    }

    func dashboadCollectionArray() -> [String] {
        let collectionArray:[String] = ["Home Personal Personal Personal","Personal","Home","Personal","Home","Personal","Home","Personal"]
        return collectionArray
    }
    
}




protocol DashboadCollectionProtocol {
    func dashboadCollectionArray() -> [String]
}

protocol DashboadTableProtocol {
    
    func dashboadTableArray() -> [String]
}
