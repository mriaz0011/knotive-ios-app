//
//  FollowingDummyFeedsData.swift
//  Knotive
//
//  Created by Muhammad Riaz on 20/01/2021.
//

import UIKit

struct FollowingDummyFeedsData {
    
    var followingItems =
        [
            FollowingTVCellModel(postID: "following_1", friendName: "Gold Smith", friendPhoto: "profile_photo_2", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "0", viewsCount: "300", commentsCount: "1000", likesCount: "12", postTime: "1610494799.185297"),
            FollowingTVCellModel(postID: "following_2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "Many many happy returns of the day.", images: ["",""], totalImages: "1", viewsCount: "203", commentsCount: "2005", likesCount: "20", postTime: "1610494799.185234"),
            FollowingTVCellModel(postID: "following_3", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "2", viewsCount: "400", commentsCount: "190", likesCount: "89", postTime: "1610495470.94074"),
            FollowingTVCellModel(postID: "following_4", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "3", viewsCount: "900", commentsCount: "1090", likesCount: "0", postTime: "1610495443.174473"),
            FollowingTVCellModel(postID: "following_5", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "4", viewsCount: "700", commentsCount: "456", likesCount: "0", postTime: "1610495398.066804")
        ]
    
    mutating func getFeedHeight(id postID: String, completion: (CGFloat) -> ()) {
        for feed in self.followingItems {
            if feed.postID == postID {
                let height =  feed.getHeight(data: feed)
                completion(height)
            }
        }
    }
    
    mutating func getFeed(id postID: String, completion: (FollowingTVCellModel) -> ()) {
        for feed in self.followingItems {
            if feed.postID == postID {
                completion(feed)
            }
        }
    }
}
