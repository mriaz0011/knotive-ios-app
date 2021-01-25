//
//  AllFeedsVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class AllFeedsVC: BaseMenuVC {
    
    class var storyboardID: String {
        return "AllFeedsVC"
    }
    class var storyboardName: String {
        return "AllFeeds"
    }
    
    var allFeedsItems: [AllFeedsTVCellModel] = []
    private var lastContentOffset: CGFloat = 0
    var followingMenuItems: [AllFeedsMenuModel] = []
    
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navView: UIStackView!
    @IBOutlet weak var allFeedsTableView: UITableView!
    @IBOutlet weak var followingMenuCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyDataOfPosts()
        //        postsTableView.estimatedRowHeight = 100
        allFeedsTableView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        setupTableView()
        setupCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TabBarsTable.main?.tabBar.isHidden = true
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
        
        followingMenuCV.dataSource = self
        followingMenuCV.delegate = self
        
        let nib = UINib(nibName: AllFeedsMenuCVCell.nibName, bundle: nil)
        followingMenuCV?.register(nib, forCellWithReuseIdentifier: AllFeedsMenuCVCell.reuseIdentifier)
        if let flowLayout = self.followingMenuCV?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupTableView() {
        
        allFeedsTableView.dataSource = self
        allFeedsTableView.delegate = self
                    
        allFeedsTableView.register(UINib(nibName: FollowingTVCell.nibName, bundle: nil), forCellReuseIdentifier: FollowingTVCell.reuseIdentifier)
        allFeedsTableView.register(UINib(nibName: WatchingTVCell.nibName, bundle: nil), forCellReuseIdentifier: WatchingTVCell.reuseIdentifier)
    }
    
    func getFeedCellHeight(data cellData: AllFeedsTVCellModel) -> CGFloat {
        
        let cellType = cellData.postType
        
        switch cellType {
        case .following:
            var followingFeeds = FollowingDummyFeedsData()
            var totalheight: CGFloat = 0.0
            followingFeeds.getFeedHeight(id: cellData.postID) { (height) in
                totalheight = height
            }
            return totalheight
        case .groups:
            return 0.0
        case .market:
            return 0.0
        case .mates:
            return 0.0
        case .watching:
            var followingFeeds = WatchingDummyFeedsData()
            var totalheight: CGFloat = 0.0
            followingFeeds.getFeedHeight(id: cellData.postID) { (height) in
                totalheight = height
            }
            return totalheight
        }
    }
}

extension AllFeedsVC: UITableViewDataSource, UITableViewDelegate {
    
//    func calculateRowHeight(for rowNumber: Int) -> CGFloat {
//
//        let data = friendsFollowingItems[rowNumber]
//        var imageHeight: CGFloat = 0.0
//        let totalImages = Int(data.totalImages) ?? 0
//        if totalImages == 0 {
//            imageHeight = 0
//        } else {
//            imageHeight = 258
//        }
//        var titleHeight: CGFloat = 0.0
//        if data.title != "" {
//            titleHeight = data.title.height(withConstrainedWidth: ScreenSize.width, font: FontBook.CrimsonTextSemiBold.of(size: 18.0)) + 6.0
//        }
//        var detailHeight: CGFloat = data.details.height(withConstrainedWidth: ScreenSize.width, font: FontBook.Regular.of(size: 13.0)) + 10
//        if detailHeight > 110 {
//            detailHeight = 110
//        }
//        let headerHeight: CGFloat = 70.0
//        let reactBarHeight: CGFloat = 60.0
//        return headerHeight + titleHeight + detailHeight + imageHeight + reactBarHeight + 10.0
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return calculateRowHeight(for: indexPath.row)
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friendsFollowingItems.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if let cell = followingTableView.dequeueReusableCell(withIdentifier: FollowingTVCell.reuseIdentifier, for: indexPath) as? FollowingTVCell {
//            let data = friendsFollowingItems[indexPath.row]
//            cell.configureCell(data: data, index: indexPath.row)
//            
//            cell.selectionStyle = .none
//            
//            return cell
//        }
//        
//        return UITableViewCell()
//    }
}

extension AllFeedsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followingMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = followingMenuCV.dequeueReusableCell(withReuseIdentifier: AllFeedsMenuCVCell.reuseIdentifier, for: indexPath) as? AllFeedsMenuCVCell {
            cell.configureCell(data: followingMenuItems[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension AllFeedsVC: UICollectionViewDelegateFlowLayout {
    
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

extension AllFeedsVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
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
}

extension AllFeedsVC {
    
    private func dummyDataOfPosts() {
        
        followingMenuItems = [AllFeedsMenuModel(itemName: "All"), AllFeedsMenuModel(itemName: "Groups"), AllFeedsMenuModel(itemName: "Mates"), AllFeedsMenuModel(itemName: "Market"), AllFeedsMenuModel(itemName: "Watching"), AllFeedsMenuModel(itemName: "Following"), AllFeedsMenuModel(itemName: "Yours"), AllFeedsMenuModel(itemName: "Saved")]
        
        allFeedsItems = [AllFeedsTVCellModel(postID: "following_1", postType: .following, postTime: "1610494799.185297"), AllFeedsTVCellModel(postID: "watching_1", postType: .watching, postTime: "1610494799.185297"), AllFeedsTVCellModel(postID: "watching_2", postType: .watching, postTime: "1610494799.185297")]
            /*FollowingTVCellModel(postID: "2", friendName: "Gold Smith", friendPhoto: "profile_photo_2", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "0", viewsCount: "300", commentsCount: "1000", likesCount: "12", postTime: "1610494799.185297"),
            FollowingTVCellModel(postID: "1", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "Many many happy returns of the day.", images: ["",""], totalImages: "1", viewsCount: "203", commentsCount: "2005", likesCount: "20", postTime: "1610494799.185234"),
            FollowingTVCellModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "2", viewsCount: "400", commentsCount: "190", likesCount: "89", postTime: "1610495470.94074"),
            FollowingTVCellModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "3", viewsCount: "900", commentsCount: "1090", likesCount: "0", postTime: "1610495443.174473"),
            FollowingTVCellModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "4", viewsCount: "700", commentsCount: "456", likesCount: "0", postTime: "1610495398.066804")
        ]*/
    }
}

