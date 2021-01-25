//
//  MenuListHeaderView.swift
//  Knotive
//
//  Created by Muhammad Riaz on 04/01/2021.
//

import UIKit

class MenuListHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleNAme: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerView.layer.cornerRadius = 4
        imageView.setImageColor(color: .darkGray)
        self.tintColor = .white
    }
}
 
