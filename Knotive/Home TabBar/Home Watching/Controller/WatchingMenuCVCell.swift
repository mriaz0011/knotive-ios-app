//
//  WatchingMenuCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 15/01/2021.
//

import UIKit

class WatchingMenuCVCell: UICollectionViewCell {
    
    @IBOutlet weak var itemMenuLabel: ItemMenuLabel!
    @IBOutlet weak var selectedMenuLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "WatchingMenuCVCell"
    }
    class var nibName: String {
        return "WatchingMenuCVCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedMenuLabel.isHidden = true
    }
    
    func configureCell(data: WatchingMenuModel) {
        //
        let itemName = data.itemName
        itemName == "Watching" ? (selectedMenuLabel.isHidden = false) : (selectedMenuLabel.isHidden = true)
        itemMenuLabel.text = itemName
    }
}
