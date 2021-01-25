//
//  SubTabBars.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

struct TabIndexes {
    var main: Int = 0
    var sub: Int = 5
}

struct TabBarsTable {
    
//    static var isChildVCShowRequest: Bool = false
//    static var childVCName: String = ""
//    static var selectedMainTabIndex = 0
//    static var selectedSubTabIndex = 0
    
    static var main: UITabBarController?
    static var home: UITabBarController?
    static var groups: UITabBarController?
    static var jobs: UITabBarController?
    static var market: UITabBarController?
    static var rooms: UITabBarController?
    
    static let mainIndex: Int = 0
    static let homeIndex: Int = 0
    static let groupsIndex: Int = 1
    static let jobsIndex: Int = 2
    static let marketIndex: Int = 3
    static let roomsIndex: Int = 4
    
    struct Home {
        static let feedsIndex: Int = 0
        static let chatsIndex: Int = 1
        static let videosIndex: Int = 2
        static let exploreIndex: Int = 3
        static let eventsIndex: Int = 4
    }
    
    struct Groups {
        static let feedsIndex: Int = 0
        static let chatsIndex: Int = 1
        static let videosIndex: Int = 2
        static let exploreIndex: Int = 3
        static let eventsIndex: Int = 4
    }
    
    struct Jobs {
        static let feedsIndex: Int = 0
        static let chatsIndex: Int = 1
        static let videosIndex: Int = 2
        static let searchIndex: Int = 3
        static let applicationsIndex: Int = 4
    }
    
    struct Market {
        static let feedsIndex: Int = 0
        static let searchIndex: Int = 1
        static let exploreIndex: Int = 2
        static let chatsIndex: Int = 3
        static let itemsIndex: Int = 4
    }
    
    struct Rooms {
        static let feedsIndex: Int = 0
        static let chatsIndex: Int = 1
        static let videosIndex: Int = 2
        static let filesIndex: Int = 3
        static let profilesIndex: Int = 4
    }
    
    static func tabImageName(_ value: String) -> String {
        switch value {
        case K.Main.home.string:
            return "icons8-home"
        case K.Main.groups.string:
            return "icons8-user-groups"
        case K.Main.jobs.string:
            return "icons8-job-seeker"
        case K.Main.market.string:
            return "icons8-shop"
        case K.Main.rooms.string:
            return "icons8-video-conference"
        default:
            return "icons8-home"
        }
    }
    
    static func goToSelectedTab(_ tabIndex: TabIndexes) {
        
        switch tabIndex.main {
        case K.Main.home.number:
            TabBarsTable.main?.selectedIndex = K.Main.home.number
            switch tabIndex.sub {
            case K.Main.Home.feeds.number:
                TabBarsTable.home?.selectedIndex = K.Main.Home.feeds.number
                break
            case K.Main.Home.chats.number:
                TabBarsTable.home?.selectedIndex = K.Main.Home.chats.number
                break
            case K.Main.Home.videos.number:
                TabBarsTable.home?.selectedIndex = K.Main.Home.videos.number
                break
            case K.Main.Home.explore.number:
                TabBarsTable.home?.selectedIndex = K.Main.Home.explore.number
                break
            case K.Main.Home.events.number:
                TabBarsTable.home?.selectedIndex = K.Main.Home.events.number
                break
            default:
                break
            }
            break
        case K.Main.groups.number:
            TabBarsTable.main?.selectedIndex = K.Main.groups.number
            switch tabIndex.sub {
            case K.Main.Groups.feeds.number:
                TabBarsTable.groups?.selectedIndex = K.Main.Groups.feeds.number
                break
            case K.Main.Groups.chats.number:
                TabBarsTable.groups?.selectedIndex = K.Main.Groups.chats.number
                break
            case K.Main.Groups.explore.number:
                break
            case K.Main.Groups.events.number:
                TabBarsTable.groups?.selectedIndex = K.Main.Groups.events.number
                break
            case K.Main.Groups.videos.number:
                TabBarsTable.groups?.selectedIndex = K.Main.Groups.videos.number
                break
            default:
                break
            }
            break
        case K.Main.jobs.number:
            TabBarsTable.main?.selectedIndex = K.Main.jobs.number
            switch tabIndex.sub {
            case K.Main.Jobs.ads.number:
                TabBarsTable.jobs?.selectedIndex = K.Main.Jobs.ads.number
                break
            case K.Main.Jobs.chats.number:
                TabBarsTable.jobs?.selectedIndex = K.Main.Jobs.chats.number
                break
            case K.Main.Jobs.videos.number:
                TabBarsTable.jobs?.selectedIndex = K.Main.Jobs.videos.number
                break
            case K.Main.Jobs.search.number:
                TabBarsTable.jobs?.selectedIndex = K.Main.Jobs.search.number
                break
            case K.Main.Jobs.applications.number:
                TabBarsTable.jobs?.selectedIndex = K.Main.Jobs.applications.number
                break
            default:
                break
            }
            break
        case K.Main.market.number:
            TabBarsTable.main?.selectedIndex = K.Main.market.number
            switch tabIndex.sub {
            case K.Main.Market.ads.number:
                TabBarsTable.market?.selectedIndex = K.Main.Market.ads.number
                break
            case K.Main.Market.search.number:
                TabBarsTable.market?.selectedIndex = K.Main.Market.search.number
                break
            case K.Main.Market.videos.number:
                TabBarsTable.market?.selectedIndex = K.Main.Market.videos.number
                break
            case K.Main.Market.chats.number:
                TabBarsTable.market?.selectedIndex = K.Main.Market.chats.number
                break
            case K.Main.Market.items.number:
                TabBarsTable.market?.selectedIndex = K.Main.Market.items.number
                break
            default:
                break
            }
            break
        case K.Main.rooms.number:
            TabBarsTable.main?.selectedIndex = K.Main.rooms.number
            switch tabIndex.sub {
            case K.Main.Rooms.feeds.number:
                TabBarsTable.rooms?.selectedIndex = K.Main.Rooms.feeds.number
                break
            case K.Main.Rooms.chats.number:
                TabBarsTable.rooms?.selectedIndex = K.Main.Rooms.chats.number
                break
            case K.Main.Rooms.videos.number:
                TabBarsTable.rooms?.selectedIndex = K.Main.Rooms.videos.number
                break
            case K.Main.Rooms.files.number:
                TabBarsTable.rooms?.selectedIndex = K.Main.Rooms.files.number
                break
            case K.Main.Rooms.profiles.number:
                TabBarsTable.rooms?.selectedIndex = K.Main.Rooms.profiles.number
                break
            default:
                break
            }
            break
        default:
            break
        }
    }
    
    static func getTabIndexes(main mainString: String, sub subString: String) -> TabIndexes {
        
        var tabIndexes = TabIndexes(main: 0, sub: 0)
        switch mainString {
        case K.Main.home.string:
            tabIndexes.main = K.Main.home.number
            switch subString {
            case K.Main.Home.feeds.string:
                tabIndexes.sub = K.Main.Home.feeds.number
                break
            case K.Main.Home.chats.string:
                tabIndexes.sub = K.Main.Home.chats.number
                break
            case K.Main.Home.videos.string:
                tabIndexes.sub = K.Main.Home.videos.number
                break
            case K.Main.Home.explore.string:
                tabIndexes.sub = K.Main.Home.explore.number
                break
            case K.Main.Home.events.string:
                tabIndexes.sub = K.Main.Home.events.number
                break
            default:
                break
            }
            break
        case K.Main.groups.string:
            tabIndexes.main = K.Main.groups.number
            switch subString {
            case K.Main.Groups.feeds.string:
                tabIndexes.sub = K.Main.Groups.feeds.number
                break
            case K.Main.Groups.chats.string:
                tabIndexes.sub = K.Main.Groups.chats.number
                break
            case K.Main.Groups.explore.string:
                tabIndexes.sub = K.Main.Groups.explore.number
                break
            case K.Main.Groups.events.string:
                tabIndexes.sub = K.Main.Groups.events.number
                break
            case K.Main.Groups.videos.string:
                tabIndexes.sub = K.Main.Groups.videos.number
                break
            default:
                break
            }
            break
        case K.Main.jobs.string:
            tabIndexes.main = K.Main.jobs.number
            switch subString {
            case K.Main.Jobs.ads.string:
                tabIndexes.sub = K.Main.Jobs.ads.number
                break
            case K.Main.Jobs.chats.string:
                tabIndexes.sub = K.Main.Jobs.chats.number
                break
            case K.Main.Jobs.videos.string:
                tabIndexes.sub = K.Main.Jobs.videos.number
                break
            case K.Main.Jobs.search.string:
                tabIndexes.sub = K.Main.Jobs.search.number
                break
            case K.Main.Jobs.applications.string:
                tabIndexes.sub = K.Main.Jobs.applications.number
                break
            default:
                break
            }
            break
        case K.Main.market.string:
            tabIndexes.main = K.Main.market.number
            switch subString {
            case K.Main.Market.ads.string:
                tabIndexes.sub = K.Main.Market.ads.number
                break
            case K.Main.Market.search.string:
                tabIndexes.sub = K.Main.Market.search.number
                break
            case K.Main.Market.videos.string:
                tabIndexes.sub = K.Main.Market.videos.number
                break
            case K.Main.Market.chats.string:
                tabIndexes.sub = K.Main.Market.chats.number
                break
            case K.Main.Market.items.string:
                tabIndexes.sub = K.Main.Market.items.number
                break
            default:
                break
            }
            break
        case K.Main.rooms.string:
            tabIndexes.main = K.Main.rooms.number
            switch subString {
            case K.Main.Rooms.feeds.string:
                tabIndexes.sub = K.Main.Rooms.feeds.number
                break
            case K.Main.Rooms.chats.string:
                tabIndexes.sub = K.Main.Rooms.chats.number
                break
            case K.Main.Rooms.videos.string:
                tabIndexes.sub = K.Main.Rooms.videos.number
                break
            case K.Main.Rooms.files.string:
                tabIndexes.sub = K.Main.Rooms.files.number
                break
            case K.Main.Rooms.profiles.string:
                tabIndexes.sub = K.Main.Rooms.profiles.number
                break
            default:
                break
            }
            break
        default:
            break
        }
        return tabIndexes
    }
}
