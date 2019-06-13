//
//  DataModal.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit


class DataModal: NSObject ,DashboadCollectionProtocol, DashboadTableProtocol{
    
    
   
    var categaryArray: [String]
//    var subcategaryArray: [String]
    var subcategaryArray: [[String]]
    
    override init() {
        self.categaryArray = ["categary 1","categary 2","categary 3","categary 4","categary 5","categary 6","categary 7","categary 8"]
//        self.subcategaryArray = ["Home Personal Personal Personal","Personal","Home","Personal","Home","Personal","Home","Personal"]
        self.subcategaryArray = [["subcategary 1 of 1","subcategary 1  of 2"],["subcategary 2 of 1","subcategary 2 of 2"],["subcategary 3 of 1","subcategary 3 of 2"],["subcategary 4 of 1","subcategary 4 of 2"],["subcategary 5 of 1","subcategary 5 of 2"],["subcategary 6 of 1","subcategary 6 of 2"],["subcategary 7 of 1","subcategary 7 of 2"],["subcategary 8 of 1","subcategary 8 of 2"]]
    }
    
    func dashboadTableArray() -> [String] {

        return categaryArray
    }

//    func dashboadCollectionArray() -> [String] {
      func dashboadCollectionArray() -> [[String]] {
        return subcategaryArray
    }
    
}




protocol DashboadCollectionProtocol {
    func dashboadCollectionArray() -> [[String]]
//    func dashboadCollectionArray() -> [String]
}

protocol DashboadTableProtocol {
    
    func dashboadTableArray() -> [String]
}



