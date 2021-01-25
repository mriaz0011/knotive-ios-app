//
//  FriendsFeedsFollowingModel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

struct FollowingTVCellModel {
    
    let postID: String
    let friendName: String
    let friendPhoto: String
    let title: String
    let details: String
    let images: [String]
    let totalImages: String
    let viewsCount: String
    let commentsCount: String
    let likesCount: String
    let postTime: String
    
    func getHeight(data cellData: FollowingTVCellModel) -> CGFloat {
        
        var imageHeight: CGFloat = 0.0
        let totalImages = Int(cellData.totalImages) ?? 0
        if totalImages == 0 {
            imageHeight = 0
        } else {
            imageHeight = 258
        }
        var titleHeight: CGFloat = 0.0
        if cellData.title != "" {
            titleHeight = cellData.title.height(withConstrainedWidth: ScreenSize.width, font: FontBook.CrimsonTextSemiBold.of(size: 18.0)) + 6.0
        }
        var detailHeight: CGFloat = cellData.details.height(withConstrainedWidth: ScreenSize.width, font: FontBook.Regular.of(size: 13.0)) + 10
        if detailHeight > 110 {
            detailHeight = 110
        }
        let headerHeight: CGFloat = 70.0
        let reactBarHeight: CGFloat = 60.0
        return headerHeight + titleHeight + detailHeight + imageHeight + reactBarHeight + 10.0
    }
}

