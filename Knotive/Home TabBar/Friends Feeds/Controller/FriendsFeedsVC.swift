//
//  FriendsFeedsVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FriendsFeedsVC: BaseMenuVC {
    
    class var storyboardID: String {
        return "FriendsFeedsVC"
    }
    class var storyboardName: String {
        return "FriendsFeeds"
    }
    
    var friendsPostItems: [FriendsFeedsPostModel] = []
    private var lastContentOffset: CGFloat = 0
    var friendsMenuItems: [FriendsMenuModel] = []
    
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navView: UIStackView!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var friendsMenuCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyDataOfPosts()
        //        postsTableView.estimatedRowHeight = 100
        postsTableView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        
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
    
    @IBAction func unwindToHomeFeeds(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        //        if let sourceViewController = unwindSegue.source as? HomeFeedsSearchVC {
        //            print(sourceViewController.simpleString)
        //        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Main.Home.Feeds.searchVC.segue {
            if let feedsSearchVC = segue.destination as? HomeFeedsSearchVC {
                _ = feedsSearchVC.doINeedData ? print("Yes Pass Data") : print("No Need To Pass Data")
            }
        }
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
}

extension FriendsFeedsVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupCollectionView() {
        
        friendsMenuCV.dataSource = self
        friendsMenuCV.delegate = self
        
        let nib = UINib(nibName: FriendsMenuCell.nibName, bundle: nil)
        friendsMenuCV?.register(nib, forCellWithReuseIdentifier: FriendsMenuCell.reuseIdentifier)
        if let flowLayout = self.friendsMenuCV?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupTableView() {
        
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: FriendsFeedsPostCell.nibName, bundle: nil), forCellReuseIdentifier: FriendsFeedsPostCell.reuseIdentifier)
    }
    
    func calculateRowHeight(for rowNumber: Int) -> CGFloat {
        
        let data = friendsPostItems[rowNumber]
        var imageHeight: CGFloat = 0.0
        let totalImages = Int(data.totalImages) ?? 0
        if totalImages == 0 {
            imageHeight = 0
        } else {
            imageHeight = 258
        }
        var titleHeight: CGFloat = 0.0
        if data.title != "" {
            titleHeight = data.title.height(withConstrainedWidth: ScreenSize.width, font: FontBook.CrimsonTextSemiBold.of(size: 18.0)) + 6.0
        }
        var detailHeight: CGFloat = data.details.height(withConstrainedWidth: ScreenSize.width, font: FontBook.Regular.of(size: 13.0)) + 10
        if detailHeight > 110 {
            detailHeight = 110
        }
        let headerHeight: CGFloat = 50.0
        let reactBarHeight: CGFloat = 40.0
        return headerHeight + titleHeight + detailHeight + imageHeight + reactBarHeight + 16.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return calculateRowHeight(for: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsPostItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = postsTableView.dequeueReusableCell(withIdentifier: FriendsFeedsPostCell.reuseIdentifier, for: indexPath) as? FriendsFeedsPostCell {
            
            let data = friendsPostItems[indexPath.row]
            cell.configureCell(data: data)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension FriendsFeedsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = friendsMenuCV.dequeueReusableCell(withReuseIdentifier: FriendsMenuCell.reuseIdentifier, for: indexPath) as? FriendsMenuCell {
            cell.configureCell(data: friendsMenuItems[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FriendsFeedsVC: UICollectionViewDelegateFlowLayout {
    
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

extension FriendsFeedsVC: UIScrollViewDelegate {
    
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

extension FriendsFeedsVC {
    
    private func dummyDataOfPosts() {
        
        friendsMenuItems = [FriendsMenuModel(itemName: "Feeds"), FriendsMenuModel(itemName: "Stories"), FriendsMenuModel(itemName: "Yours"), FriendsMenuModel(itemName: "Chats"), FriendsMenuModel(itemName: "Finds"), FriendsMenuModel(itemName: "Saved")]
        
        friendsPostItems = [
            FriendsFeedsPostModel(postID: "2", friendName: "Gold Smith", friendPhoto: "profile_photo_2", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "0", viewsCount: "0", commentsCount: "1000", likesCount: "45", postTime: "1610494799.185297"),
            FriendsFeedsPostModel(postID: "1", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "Many many happy returns of the day.", images: ["",""], totalImages: "1", viewsCount: "203", commentsCount: "2005", likesCount: "30", postTime: "1610494799.185297"),
            FriendsFeedsPostModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "2", viewsCount: "400", commentsCount: "190", likesCount: "12", postTime: "1610494799.185297"),
            FriendsFeedsPostModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "Thank you", details: "I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "3", viewsCount: "900", commentsCount: "0", likesCount: "4", postTime: "1610494799.185297"),
            FriendsFeedsPostModel(postID: "2", friendName: "Jack Danial", friendPhoto: "profile_photo_1", title: "", details: "I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday. I am very very thank to my friends wishig me my birthday.", images: ["ic_onboarding_5"], totalImages: "4", viewsCount: "700", commentsCount: "456", likesCount: "0", postTime: "1610494799.185297")
        ]
    }
}
