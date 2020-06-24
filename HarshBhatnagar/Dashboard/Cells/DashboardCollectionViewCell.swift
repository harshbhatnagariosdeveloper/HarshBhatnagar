//
//  DashboardCollectionViewCell.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var lblCollection: UILabel!
    
    
    //MARK: - func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with lbl: String, index:Int) {
        lblCollection.text = lbl
        self.contentView.layer.cornerRadius = 4
        if index % 2 == 0{
            self.contentView.backgroundColor = UIColor.lightGray
        }else{
            self.contentView.backgroundColor = UIColor.yellow
        }
    }
}
