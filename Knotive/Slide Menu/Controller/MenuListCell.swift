//
//  MenuListCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 05/01/2021.
//

import UIKit

class MenuListCell: UITableViewCell {
    
    @IBOutlet weak var childVCName: UILabel!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
