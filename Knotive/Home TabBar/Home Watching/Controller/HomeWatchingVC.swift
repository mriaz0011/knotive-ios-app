//
//  HomeWatchingVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class HomeWatchingVC: BaseMenuVC {
    
    class var storyboardID: String {
        return "HomeWatchingVC"
    }
    class var storyboardName: String {
        return "HomeWatching"
    }
    
    var usersWatchingItems: [WatchingTVCellModel] = []
    var watchingMenuItems: [WatchingMenuModel] = []
    private var lastContentOffset: CGFloat = 0
    private var playVideo: Bool?
    private var player = [AVPlayer]()
    
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navView: UIStackView!
    @IBOutlet weak var watchingTableView: UITableView!
    @IBOutlet weak var watchingMenuCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyDataOfPosts()
        //        postsTableView.estimatedRowHeight = 100
        watchingTableView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        setupTableView()
        setupCollectionView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        TabBarsTable.main?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //Pause video before changing tabs.
        watchingTableView.visibleCells.forEach { cell in
            if let visibleCell = cell as? WatchingTVCell {
                visibleCell.userLogVideo.player!.pause()
            }
        }
    }
    
    
    @IBAction func goToTab2(_ sender: UIButton) {
        performSegue(withIdentifier: K.Main.Home.Feeds.searchVC.segue, sender: nil)
        
    }
    
    @IBAction func unwindToHomeFollowing(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        //        if let sourceViewController = unwindSegue.source as? HomeFeedsSearchVC {
        //            print(sourceViewController.simpleString)
        //        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == K.Main.Home.Feeds.searchVC.segue {
//            if let feedsSearchVC = segue.destination as? HomeFeedsSearchVC {
//                _ = feedsSearchVC.doINeedData ? print("Yes Pass Data") : print("No Need To Pass Data")
//            }
//        }
    }
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        guard let slideMenuVC = UIStoryboard(name: "SlideMenu", bundle: nil).instantiateViewController(withIdentifier: "SlideMenuVC") as? SlideMenuVC else { return }
        slideMenuVC.didTapMenuType = { item in
            TabBarsTable.goToSelectedTab(item)
        }
        slideMenuVC.modalPresentationStyle = .overCurrentContext
        slideMenuVC.transitioningDelegate = self
        present(slideMenuVC, animated: true)
    }
    
    func setupCollectionView() {
        
        watchingMenuCV.dataSource = self
        watchingMenuCV.delegate = self
        
        let nib = UINib(nibName: WatchingMenuCVCell.nibName, bundle: nil)
        watchingMenuCV?.register(nib, forCellWithReuseIdentifier: WatchingMenuCVCell.reuseIdentifier)
        if let flowLayout = self.watchingMenuCV?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupTableView() {
        
        watchingTableView.dataSource = self
        watchingTableView.delegate = self
                    
        watchingTableView.register(UINib(nibName: WatchingTVCell.nibName, bundle: nil), forCellReuseIdentifier: WatchingTVCell.reuseIdentifier)
    }
}

extension HomeWatchingVC: UITableViewDataSource, UITableViewDelegate {
    
    func calculateRowHeight(for rowNumber: Int) -> CGFloat {
        
        let data = usersWatchingItems[rowNumber]
        let videoHeight: CGFloat = 240.0
        var titleHeight: CGFloat = data.title.height(withConstrainedWidth: ScreenSize.width, font: FontBook.CrimsonTextSemiBold.of(size: 18.0)) + 6.0
        if titleHeight > 60 {
            titleHeight = 110
        } else {
            titleHeight = 60
        }
        let reactBarHeight: CGFloat = 40.0
        return titleHeight + videoHeight + reactBarHeight + 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return calculateRowHeight(for: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersWatchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("Actual cell \(indexPath.row)")
        if let cell = watchingTableView.dequeueReusableCell(withIdentifier: WatchingTVCell.reuseIdentifier, for: indexPath) as? WatchingTVCell {
            let data = usersWatchingItems[indexPath.row]
            cell.configureCell(data: data, index: indexPath.row)
            cell.selectionStyle = .none
            
//            if cell == tableView.visibleCells.first {
//                cell.userLogVideo.player?.play()
//            } else {
//                cell.userLogVideo.player?.pause()
//                cell.userLogVideo.player = nil
//            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let videoCell = (cell as? UserFeedsWatchingCell) else { return }
//        print("Visible Cell \(indexPath.row)")
//        player[indexPath.row].play()
//        watchingTableView.reloadData()
//        videoCell.userLogVideo.player?.play()
//        let visibleCells = tableView.visibleCells;
//        let minIndex = visibleCells.startIndex;
//        if watchingTableView.visibleCells.firstIndex(of: cell) == minIndex {
//            videoCell.userLogVideo.player?.play();
//        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("End Cell \(indexPath.row)")
//        guard let videoCell = cell as? UserFeedsWatchingCell else { return }
//        player[indexPath.row].pause()
    }
}

extension HomeWatchingVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Play and Pause video
        tableVisibleCell(scrollView: scrollView)
        
        if let _ = scrollView as? UITableView {
            //Stretching nav height
            let y = 88 - (scrollView.contentOffset.y + 88)
            let height = min(max(y, 0), 105)
            navViewHeight.constant = height
            
            if (self.lastContentOffset > scrollView.contentOffset.y) {
    //            print("move up")
                navViewHeight.constant = 88
                UIView.animate(withDuration: 0.7) {
                    self.navView.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
    //            print("move down")
                if scrollView.contentOffset.y > -88.0 {
                    navViewHeight.constant = 0
                    UIView.animate(withDuration: 0.7) {
                        self.navView.alpha = 0
                        self.view.layoutIfNeeded()
                    }
                }
            }
            // update the new position acquired
            self.lastContentOffset = scrollView.contentOffset.y
        }
    }
    
    private func tableVisibleCell(scrollView: UIScrollView) {
        
        var userVideo = [AVPlayer]()
        //Getting visible cells.
        //At the moment in iPhone 11 three cells. But code is written for any screen.
        watchingTableView.visibleCells.forEach { cell in
            if let visibleCell = cell as? WatchingTVCell {
                userVideo.append(visibleCell.userLogVideo.player!)
            }
        }
        
        //Getting top and bottom
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = Float(scrollView.contentSize.height)
        let scrollOffset = Float(scrollView.contentOffset.y)
        if scrollOffset == -88 { //Change this value according with tableView UIEdgeInsets(top: 88
            // then we are at the top
            var value = 0
            for player in userVideo {
                if value == 0 { //First item
                    player.play()
                    value += 1
                } else {
                    value += 1
                    player.pause()
                }
            }
        } else if scrollOffset + Float(scrollViewHeight) == scrollContentSizeHeight {
            // then we are at the end
            let last = userVideo.count - 1
            var value = 0
            for player in userVideo {
                if value == last { //Last item
                    player.play()
                    value += 1
                } else {
                    value += 1
                    player.pause()
                }
            }
        } else {
            //For middle of the screen cells.
            var value = 0
            for player in userVideo {
                if value == 1 { //Second item
                    player.play()
                    value += 1
                } else {
                    value += 1
                    player.pause()
                }
            }
        }
    }
}

extension HomeWatchingVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchingMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = watchingMenuCV.dequeueReusableCell(withReuseIdentifier: WatchingMenuCVCell.reuseIdentifier, for: indexPath) as? WatchingMenuCVCell {
            cell.configureCell(data: watchingMenuItems[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeWatchingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: WatchingMenuCVCell = Bundle.main.loadNibNamed(WatchingMenuCVCell.nibName, owner: self, options: nil)?.first as? WatchingMenuCVCell else {
            return CGSize.zero
        }
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        return CGSize(width: size.width, height: 90)
        return CGSize(width: 80, height: 44)
    }
}

extension HomeWatchingVC {
    
    private func dummyDataOfPosts() {
        
        watchingMenuItems = [WatchingMenuModel(itemName: "Watching"), WatchingMenuModel(itemName: "Trending"), WatchingMenuModel(itemName: "Yours"), WatchingMenuModel(itemName: "Categories"), WatchingMenuModel(itemName: "Likes"), WatchingMenuModel(itemName: "Saved")]
        
        usersWatchingItems = [
            WatchingTVCellModel(postID: "2", userName: "@outfit", userPhoto: "profile_photo_2", title: "What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "sport_image", viewsCount: "300", commentsCount: "1000", likesCount: "12", postTime: "1610494799.185297", videoDuration: "12:01"),
            WatchingTVCellModel(postID: "1", userName: "@gymdaily", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video_2", videoImage: "gym_image", viewsCount: "203", commentsCount: "2005", likesCount: "20", postTime: "1610494799.185234", videoDuration: "00:55"),
            WatchingTVCellModel(postID: "2", userName: "@cookingexpert", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "dentist_room", viewsCount: "400", commentsCount: "190", likesCount: "89", postTime: "1610495470.94074", videoDuration: "03:21"),
            WatchingTVCellModel(postID: "2", userName: "@homedecor", userPhoto: "profile_photo_1", title: "What a magical look of dentist room?", video: "sample_portrait_video_2", videoImage: "dentist_room", viewsCount: "900", commentsCount: "1090", likesCount: "0", postTime: "1610495443.174473", videoDuration: "04:59"),
            WatchingTVCellModel(postID: "2", userName: "@techstuff", userPhoto: "profile_photo_1", title: "What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room? What a magical look of dentist room?", video: "sample_portrait_video", videoImage: "tech_image", viewsCount: "700", commentsCount: "456", likesCount: "0", postTime: "1610495398.066804", videoDuration: "01:35")
        ]
    }
}
