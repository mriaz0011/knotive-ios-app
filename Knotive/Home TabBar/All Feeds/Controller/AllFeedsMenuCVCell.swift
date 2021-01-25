//
//  AllFeedsMenuCVCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 15/01/2021.
//

import UIKit

class AllFeedsMenuCVCell: UICollectionViewCell {
    
    @IBOutlet weak var itemMenuLabel: ItemMenuLabel!
    @IBOutlet weak var selectedMenuLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "AllFeedsMenuCVCell"
    }
    class var nibName: String {
        return "AllFeedsMenuCVCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedMenuLabel.isHidden = true
    }
    
    func configureCell(data: AllFeedsMenuModel) {
        //
        let itemName = data.itemName
        itemName == "All" ? (selectedMenuLabel.isHidden = false) : (selectedMenuLabel.isHidden = true)
        itemMenuLabel.text = itemName
    }
}
