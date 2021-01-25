//
//  ChatFriendsCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

class ChatFriendsCell: UITableViewCell {
    
    class var reuseIdentifier: String {
        return "ChatFriendsCell"
    }
    class var nibName: String {
        return "ChatFriendsCell"
    }
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var newNotification: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: ChatFriendsModel) {
        
        let message = data.lastMessageContent.maxLength(length: 28)
        let messageTime = " [ \(data.lastMessageTime.timeAgo()) ]"
        
        let attributedTitle = NSMutableAttributedString(string: message, attributes: [NSAttributedString.Key.font: FontBook.Regular.of(size: 14), NSAttributedString.Key.foregroundColor: AppColors.grayDark.color()])
        attributedTitle.append(NSAttributedString(string: messageTime, attributes: [NSAttributedString.Key.font: FontBook.RegularItalic.of(size: 12), NSAttributedString.Key.foregroundColor: AppColors.grayVeryStrong.color()]))
        
        lastMessage.attributedText = attributedTitle
        
        friendName.text = data.friendName
        friendPhoto.image = UIImage(named: data.friendPhoto)
//        lastMessage.text = data.lastMessageContent
        newNotification.text = data.newNotification
    }
}
