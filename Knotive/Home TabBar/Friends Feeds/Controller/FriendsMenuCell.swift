//
//  FriendsMenuCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 15/01/2021.
//

import UIKit

class FriendsMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var itemMenuLabel: ItemMenuLabel!
    @IBOutlet weak var selectedMenuLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "FriendsMenuCell"
    }
    class var nibName: String {
        return "FriendsMenuCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedMenuLabel.isHidden = true
    }
    
    func configureCell(data: FriendsMenuModel) {
        //
        let itemName = data.itemName
        itemName == "Feeds" ? (selectedMenuLabel.isHidden = false) : (selectedMenuLabel.isHidden = true)
        itemMenuLabel.text = itemName
    }
}
