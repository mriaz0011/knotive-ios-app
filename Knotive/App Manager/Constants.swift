//
//  Constants.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

struct K {
    static let appName = "Knotive"
    static let chatsNotificationCell = "ChatsNotificationCell"
    static let chatsNotificationCellNibName = "ChatsNotificationCell"
    static let menuNotificationCell = "MenuNotificationCell"
    static let menuNotificationCellNibName = "MenuNotificationCell"
    static let menuListCell = "MenuListCell"
    static let menuListCellNibName = "MenuListCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct ChildVCs {
        static let feedsSearchVC = (storyboard: "HomeFeeds", vcName: "HomeFeedsSearchVC")
    }
    
    struct Main {
        static let home = (string: "Home", number: 0)
        static let groups = (string: "Groups", number: 1)
        static let jobs = (string: "Jobs", number: 2)
        static let market = (string: "Market", number: 3)
        static let rooms = (string: "Rooms", number: 4)
        
        struct Home {
            static let feeds = (string: "Feeds", number: 0)
            static let chats = (string: "Chats", number: 1)
            static let videos = (string: "Videos", number: 2)
            static let explore = (string: "Explore", number: 3)
            static let events = (string: "Events", number: 4)
            
            struct Feeds {
                static let searchVC = (className: "HomeFeedsSearchVC", segue: "HomeFeedsSearchVCSegueID", vc: UIStoryboard(name: "HomeFeeds", bundle: nil).instantiateViewController(withIdentifier: "HomeFeedsSearchVC") as? HomeFeedsSearchVC)
            }
        }
        
        struct Groups {
            static let feeds = (string: "Feeds", number: 0)
            static let chats = (string: "Chats", number: 1)
            static let explore = (string: "Explore", number: 2)
            static let events = (string: "Events", number: 3)
            static let videos = (string: "Videos", number: 4)
        }
        
        struct Jobs {
            static let ads = (string: "Ads", number: 0)
            static let search = (string: "Search", number: 1)
            static let chats = (string: "Chats", number: 2)
            static let videos = (string: "Videos", number: 3)
            static let applications = (string: "Applications", number: 4)
        }
        
        struct Market {
            static let ads = (string: "Ads", number: 0)
            static let search = (string: "Search", number: 1)
            static let chats = (string: "Chats", number: 2)
            static let videos = (string: "Videos", number: 3)
            static let items = (string: "Items", number: 4)
        }
        
        struct Rooms {
            static let feeds = (string: "Feeds", number: 0)
            static let chats = (string: "Chats", number: 1)
            static let videos = (string: "Videos", number: 2)
            static let files = (string: "Files", number: 3)
            static let profiles = (string: "Profiles", number: 4)
        }
    }
}
