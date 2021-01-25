//
//  Extension+AllFeedsVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 20/01/2021.
//

import UIKit

extension AllFeedsVC {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellData = allFeedsItems[indexPath.row]
        let height = getFeedCellHeight(data: cellData)
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allFeedsItems.count
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let data = allFeedsItems[indexPath.row]
        switch data.postType {
        case .following:
            if let cell = allFeedsTableView.dequeueReusableCell(withIdentifier:FollowingTVCell.reuseIdentifier, for: indexPath) as? FollowingTVCell {
                var followingFeeds = FollowingDummyFeedsData()
                followingFeeds.getFeed(id: data.postID) { (feed) in
                    cell.configureCell(data: feed, index: indexPath.row)
                }
                cell.selectionStyle = .none
                
    //            if cell == tableView.visibleCells.first {
    //                cell.userLogVideo.player?.play()
    //            } else {
    //                cell.userLogVideo.player?.pause()
    //                cell.userLogVideo.player = nil
    //            }
                return cell
            } else {
                return UITableViewCell()
            }
        case .watching:
            if let cell = allFeedsTableView.dequeueReusableCell(withIdentifier:WatchingTVCell.reuseIdentifier, for: indexPath) as? WatchingTVCell {
                var followingFeeds = WatchingDummyFeedsData()
                followingFeeds.getFeed(id: data.postID) { (feed) in
                    cell.configureCell(data: feed, index: indexPath.row)
                }
                cell.selectionStyle = .none
                
    //            if cell == tableView.visibleCells.first {
    //                cell.userLogVideo.player?.play()
    //            } else {
    //                cell.userLogVideo.player?.pause()
    //                cell.userLogVideo.player = nil
    //            }
                return cell
            } else {
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
        let data = allFeedsItems[indexPath.row]
        switch data.postType {
        case .following:
            break
        default:
            break
        }
    }
}
