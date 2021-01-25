//
//  AllFeedsTVCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

class FollowingTVCell: UITableViewCell {
    
    class var reuseIdentifier: String {
        return "FollowingTVCell"
    }
    class var nibName: String {
        return "FollowingTVCell"
    }
    
    @IBOutlet weak var titleTextHeight: NSLayoutConstraint!
    @IBOutlet weak var detailTextHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: EssentialLabel!
    @IBOutlet weak var detailLabel: EssentialLabel!
    @IBOutlet weak var friendPhoto: EssentialImageView!
    @IBOutlet weak var friendName: EssentialLabel!
    @IBOutlet weak var postNumbers: EssentialLabel!
    @IBOutlet weak var postTime: EssentialLabel!
    
    //Hide and shows
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var primaryPhotosView: UIView!
    @IBOutlet weak var singlePhotoView: UIView!
    @IBOutlet weak var twoPhotosView: UIView!
    @IBOutlet weak var threePhotosView: UIView!
    @IBOutlet weak var threePlusPhotosView: UIView!
    //Single Photo View Image
    @IBOutlet weak var singlePhotoImage: UIImageView!
    //Two Photos View Images
    @IBOutlet weak var twoPhotosImageOne: UIImageView!
    @IBOutlet weak var twoPhotosImageTwo: UIImageView!
    //Three Photos View Images
    @IBOutlet weak var threePhotosImageOne: UIImageView!
    @IBOutlet weak var threePhotosImageTwo: UIImageView!
    @IBOutlet weak var threePhotosImageThree: UIImageView!
    //Three Plus View Images
    @IBOutlet weak var threePlusPhotosImageOne: UIImageView!
    @IBOutlet weak var threePlusPhotosImageTwo: UIImageView!
    @IBOutlet weak var threePlusPhotosImageThree: UIImageView!
    //More and Friend Details
    @IBOutlet weak var friendDetailsView: UIView!
    @IBOutlet weak var moreBtnsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moreBtnsView.isHidden = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showMoreAction(_ sender: UIButton) {
        friendDetailsView.flip(with: moreBtnsView, direction: .transitionFlipFromLeft)
    }
    
    @IBAction func hideMoreAction(_ sender: UIButton) {
        moreBtnsView.flip(with: friendDetailsView, direction: .transitionFlipFromRight)
    }
    
    func configureCell(data: FollowingTVCellModel, index: Int) {
        
        //Showing header always visible
        moreBtnsView.isHidden = true
        friendDetailsView.isHidden = false
        //Managing pos title
        if data.title == "" {
            titleTextHeight.constant = 0.0
            titleView.isHidden = true
        } else {
            titleTextHeight.constant = titleLabel.getTextHeight() + 6.0
            titleView.isHidden = false
            titleLabel.text = data.title
        }
        //Managing post photos
        let totalImages = Int(data.totalImages) ?? 0
        if totalImages > 0 {
            switch totalImages {
            case 1:
                singlePhotoView.isHidden = false
                twoPhotosView.isHidden = true
                threePhotosView.isHidden = true
                threePlusPhotosView.isHidden = true
                break
            case 2:
                singlePhotoView.isHidden = true
                twoPhotosView.isHidden = false
                threePhotosView.isHidden = true
                threePlusPhotosView.isHidden = true
                break
            case 3:
                singlePhotoView.isHidden = true
                twoPhotosView.isHidden = true
                threePhotosView.isHidden = false
                threePlusPhotosView.isHidden = true
                break
            default:
                if totalImages > 3 {
                    singlePhotoView.isHidden = true
                    twoPhotosView.isHidden = true
                    threePhotosView.isHidden = true
                    threePlusPhotosView.isHidden = false
                }
                break
            }
        } else {
            singlePhotoView.isHidden = true
            twoPhotosView.isHidden = true
            threePhotosView.isHidden = true
            threePlusPhotosView.isHidden = true
        }
        
        detailLabel.text = data.details
        let detailHeight = detailLabel.getTextHeight() + 10.0
        if detailHeight > 110 {
            detailTextHeight.constant = 110
        } else {
            detailTextHeight.constant = detailHeight
        }
        
        friendPhoto.image = UIImage(named: data.friendPhoto)
        friendName.text = data.friendName
        postTime.text = data.postTime.timeAgo()
        
        var countFooterString = ""
        if data.viewsCount != "0" {
            countFooterString += "\(data.viewsCount.getKM()) Views"
        }
        if data.viewsCount != "0" && data.commentsCount != "0" {
            countFooterString += "  ●  \(data.commentsCount.getKM()) Comments"
        } else if data.commentsCount != "0" {
            countFooterString += "\(data.commentsCount.getKM()) Comments"
        }
        if (data.viewsCount != "0" || data.commentsCount != "0") && data.likesCount != "0" {
            countFooterString += "  ●  \(data.likesCount.getKM()) Likes"
        } else if data.likesCount != "0" {
            countFooterString += "\(data.likesCount.getKM()) Likes"
        }
        postNumbers.text = countFooterString
    }
}
