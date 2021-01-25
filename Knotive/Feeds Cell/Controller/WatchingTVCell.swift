//
//  HomeWatchingTVCell.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit
import AVKit
import AVFoundation

class WatchingTVCell: UITableViewCell {
    
    class var reuseIdentifier: String {
        return "WatchingTVCell"
    }
    class var nibName: String {
        return "WatchingTVCell"
    }
    
    @IBOutlet weak var titleTextHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: EssentialLabel!
    @IBOutlet weak var totalDurationLabel: EssentialLabel!
    @IBOutlet weak var userLogVideoImage: UIImageView!
    @IBOutlet weak var userLogVideo: VideoView!
    @IBOutlet weak var userPhoto: EssentialImageView!
    @IBOutlet weak var userName: EssentialLabel!
    @IBOutlet weak var postNumbers: EssentialLabel!
    @IBOutlet weak var postTime: EssentialLabel!
    @IBOutlet weak var userTitleView: UIView!
    @IBOutlet weak var moreBtnsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func showMoreAction(_ sender: UIButton) {
        userTitleView.flip(with: moreBtnsView, direction: .transitionFlipFromLeft)
    }
    
    @IBAction func hideMoreAction(_ sender: UIButton) {
        moreBtnsView.flip(with: userTitleView, direction: .transitionFlipFromRight)
    }
    
    func configureCell(data: WatchingTVCellModel, index: Int) {
        
        //Showing header always visible
        moreBtnsView.isHidden = true
        userTitleView.isHidden = false
        //Managing height of video title
        titleLabel.text = data.title
        let titleHeight = titleLabel.getTextHeight() + 6.0
        if titleHeight > 60 {
            titleTextHeight.constant = titleHeight
        } else {
            titleTextHeight.constant = 60
        }
        
        userLogVideoImage.image = UIImage(named: data.videoImage)
        userPhoto.image = UIImage(named: data.userPhoto)
        userName.text = data.userName
        postTime.text = data.postTime.timeAgo()
        totalDurationLabel.text = data.videoDuration
        
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
        guard let videURL = videoFilePath(name: data.video) else { return }
        configureVideo(url: videURL)
    }
}

//MARK:- Video Settings
extension WatchingTVCell {
    
    func configureVideo(url: NSURL) {
        let videoURL = url
        let avPlayer = AVPlayer(url: videoURL as URL)
        userLogVideo.playerLayer.frame = userLogVideo.bounds
        userLogVideo.playerLayer.videoGravity = .resizeAspectFill
        userLogVideo.playerLayer.player = avPlayer
        userLogVideo.playerLayer.player?.isMuted = true
    }
    
    func videoFileLink(link linkName: String) -> NSURL? {
        
        let videoURL = NSURL(string: linkName)
        return videoURL
    }
    
    func videoFilePath(name fileName: String) -> NSURL? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType:"mp4") else {
            return nil
        }
        let videoURL = NSURL(fileURLWithPath: path)
        return videoURL
    }
}
