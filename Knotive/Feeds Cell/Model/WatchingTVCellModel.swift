//
//  HomeWatchingTVCellModel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

struct WatchingTVCellModel {
    
    let postID: String
    let userName: String
    let userPhoto: String
    let title: String
    let video: String
    let videoImage: String
    let viewsCount: String
    let commentsCount: String
    let likesCount: String
    let postTime: String
    let videoDuration: String
    
    func getHeight(data cellData: WatchingTVCellModel) -> CGFloat {
        
        let videoHeight: CGFloat = 240.0
        var titleHeight: CGFloat = cellData.title.height(withConstrainedWidth: ScreenSize.width, font: FontBook.CrimsonTextSemiBold.of(size: 18.0)) + 6.0
        if titleHeight > 60 {
            titleHeight = 110
        } else {
            titleHeight = 60
        }
        let reactBarHeight: CGFloat = 40.0
        return titleHeight + videoHeight + reactBarHeight + 10
    }
}
