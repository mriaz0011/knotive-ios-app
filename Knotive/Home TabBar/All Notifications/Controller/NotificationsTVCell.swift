//
//  AllNotificationsTVCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

protocol NotificationsTVCellDelegate : class {
    
    func deleteCellPressButton(_ tag: Int)
}

class NotificationsTVCell: UITableViewCell {
    
    class var reuseIdentifier: String {
        return "NotificationsTVCell"
    }
    class var nibName: String {
        return "NotificationsTVCell"
    }
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var mainTabItem: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var receivedTime: UILabel!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageImgWidthConst: NSLayoutConstraint!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var deleteCellDelegate: NotificationsTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellBackground.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = UIColor.clear
        // Configure the view for the selected state
    }
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        deleteCellDelegate?.deleteCellPressButton(sender.tag)
    }
}
