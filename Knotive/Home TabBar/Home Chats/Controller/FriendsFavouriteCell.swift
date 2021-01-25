//
//  FriendsFavouriteCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

class FriendsFavouriteCell: UICollectionViewCell {
    
    class var reuseIdentifier: String {
        return "FriendsFavouriteCell"
    }
    class var nibName: String {
        return "FriendsFavouriteCell"
    }
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var friendName: EssentialLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        friendPhoto.makeRounded()
    }
    
    func configureCell(data: FavouriteFriendsModel) {
        friendName.text = data.friendName
        friendPhoto.image = UIImage(named: data.friendPhoto)
    }
}
