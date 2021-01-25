//
//  WatchingDummyFeedsData.swift
//  Knotive
//
//  Created by Muhammad Riaz on 20/01/2021.
//

import UIKit

struct WatchingDummyFeedsData {
    
    var watchingItems =
        [
            WatchingTVCellModel(postID: "watching_1", userName: "@outfit", userPhoto: "profile_photo_2", title: "What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "sport_image", viewsCount: "300", commentsCount: "1000", likesCount: "12", postTime: "1610494799.185297", videoDuration: "12:01"),
            WatchingTVCellModel(postID: "watching_2", userName: "@gymdaily", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video_2", videoImage: "gym_image", viewsCount: "203", commentsCount: "2005", likesCount: "20", postTime: "1610494799.185234", videoDuration: "00:55"),
            WatchingTVCellModel(postID: "watching_3", userName: "@cookingexpert", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "dentist_room", viewsCount: "400", commentsCount: "190", likesCount: "89", postTime: "1610495470.94074", videoDuration: "03:21"),
            WatchingTVCellModel(postID: "watching_4", userName: "@homedecor", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video_2", videoImage: "dentist_room", viewsCount: "900", commentsCount: "1090", likesCount: "0", postTime: "1610495443.174473", videoDuration: "04:59"),
            WatchingTVCellModel(postID: "watching_5", userName: "@techstuff", userPhoto: "profile_photo_1", title: "What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "tech_image", viewsCount: "700", commentsCount: "456", likesCount: "0", postTime: "1610495398.066804", videoDuration: "01:35")
        ]
    
    mutating func getFeedHeight(id postID: String, completion: (CGFloat) -> ()) {
        for feed in self.watchingItems {
            if feed.postID == postID {
                let height =  feed.getHeight(data: feed)
                completion(height)
            }
        }
    }
    
    mutating func getFeed(id postID: String, completion: (WatchingTVCellModel) -> ()) {
        for feed in self.watchingItems {
            if feed.postID == postID {
                completion(feed)
            }
        }
    }
}
