//
//  DashboardTableViewCell.swift
//  HarshBhatnagar
//
//  Created by Harsh Bhatnagar on 11/06/19.
//  Copyright © 2019 SSH. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var collectionArray:[String] = []
    let dataModle = DataModal()
    var retunData:String = ""
    var delegate: ReturnDataFromDashboadCollectionProtocol?
    @IBOutlet weak var lblTableTitle: UILabel!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        collectionArray = dataModle.dashboadCollectionArray()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentify = "DashboardCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentify, for: indexPath) as? DashboardCollectionViewCell
        cell?.configure(with: collectionArray[indexPath.row],index: indexPath.row)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        retunData = collectionArray[indexPath.row]
        if delegate != nil {
             delegate?.fromcollectionView(Val: retunData)
        } else {
            print("Please set Delegate")
        }
    }
 }

protocol ReturnDataFromDashboadCollectionProtocol {
    func fromcollectionView(Val:String)
}
