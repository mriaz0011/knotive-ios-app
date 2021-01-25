//
//  AccountsTableCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 08/01/2021.
//

import UIKit

protocol AccountsCellDelegate : class {
    
    func deleteCellPressButton(_ tag: Int)
}

class AccountsTableCell: UITableViewCell {
    
    @IBOutlet weak var profilePhotoImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var removeBtn: UIButton!
    
    var deleteCellDelegate: AccountsCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeAccountAction(_ sender: UIButton) {
        
        deleteCellDelegate?.deleteCellPressButton(sender.tag)
    }
    
}
