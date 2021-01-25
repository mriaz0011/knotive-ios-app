//
//  HomeChatsVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class HomeChatsVC: BaseMenuVC {
    
    class var storyboardID: String {
        return "HomeChatsVC"
    }
    class var storyboardName: String {
        return "HomeChats"
    }
    
    var favouriteFriendsItems: [FavouriteFriendsModel] = []
    var chatFriendsItems: [ChatFriendsModel] = []
    private var lastContentOffset: CGFloat = 0
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var friendsFavouriteCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsTableView.contentInset = UIEdgeInsets(top: 178, left: 0, bottom: 0, right: 0)
        
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = AppColors.white.color().cgColor
        
        setupCollectionView()
        setupTableView()
        dummyFriendsFavouriteData()
        dummyChatFriendsData()
        
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
        
        friendsFavouriteCV.dataSource = self
        friendsFavouriteCV.delegate = self
        
        let nib = UINib(nibName: FriendsFavouriteCell.nibName, bundle: nil)
        friendsFavouriteCV?.register(nib, forCellWithReuseIdentifier: FriendsFavouriteCell.reuseIdentifier)
        if let flowLayout = self.friendsFavouriteCV?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupTableView() {
        
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
                    
        friendsTableView.register(UINib(nibName: ChatFriendsCell.nibName, bundle: nil), forCellReuseIdentifier: ChatFriendsCell.reuseIdentifier)
    }
}

extension HomeChatsVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let _ = scrollView as? UITableView {
            //Stretching nav height
            let y = 178 - (scrollView.contentOffset.y + 178)
            let height = min(max(y, 0), 190)
            topViewHeight.constant = height
            
            if (self.lastContentOffset > scrollView.contentOffset.y) {
    //            print("move up")
                topViewHeight.constant = 178
                UIView.animate(withDuration: 0.7) {
                    self.topStack.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
    //            print("move down")
                if scrollView.contentOffset.y > -178 {
                    topViewHeight.constant = 0
                    UIView.animate(withDuration: 0.7) {
                        self.topStack.alpha = 0
                        self.view.layoutIfNeeded()
                    }
                }
            }
            // update the new position acquired
            self.lastContentOffset = scrollView.contentOffset.y
        }
    }
}

extension HomeChatsVC {
    
    private func dummyFriendsFavouriteData() {
        
        favouriteFriendsItems = [FavouriteFriendsModel(friendPhoto: "", friendName: "Smith"), FavouriteFriendsModel(friendPhoto: "", friendName: "Michael"), FavouriteFriendsModel(friendPhoto: "", friendName: "Danial"), FavouriteFriendsModel(friendPhoto: "", friendName: "Anna"), FavouriteFriendsModel(friendPhoto: "", friendName: "David")]
    }
    
    private func dummyChatFriendsData() {
        
        chatFriendsItems = [ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match."), ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match."), ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match."), ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match."), ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match."), ChatFriendsModel(friendPhoto: "profile_photo_2", friendName: "Smith Gold", lastMessageTime: "1610495398.066804", newNotification: "23", lastMessageContent: "Hey, are you free today?"), ChatFriendsModel(friendPhoto: "profile_photo_1", friendName: "Jack Danial", lastMessageTime: "1610495398.066804", newNotification: "3", lastMessageContent: "Hurray, we won the football match.")]
    }
}

extension HomeChatsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouriteFriendsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = friendsFavouriteCV.dequeueReusableCell(withReuseIdentifier: FriendsFavouriteCell.reuseIdentifier, for: indexPath) as? FriendsFavouriteCell {
            if indexPath.row == 0 {
                let data = FavouriteFriendsModel(friendPhoto: "icons8-star", friendName: "Add Favourite")
                cell.friendPhoto.contentMode = .center
                cell.configureCell(data: data)
            } else {
                let data = favouriteFriendsItems[indexPath.row]
                cell.configureCell(data: data)
                cell.friendPhoto.contentMode = .scaleAspectFit
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeChatsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: FriendsFavouriteCell = Bundle.main.loadNibNamed(FriendsFavouriteCell.nibName, owner: self, options: nil)?.first as? FriendsFavouriteCell else {
            return CGSize.zero
        }
        cell.configureCell(data: favouriteFriendsItems[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        return CGSize(width: size.width, height: 90)
        return CGSize(width: 90, height: 90)
    }
}

extension HomeChatsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatFriendsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ChatFriendsCell.reuseIdentifier, for: indexPath) as? ChatFriendsCell {
            let data = chatFriendsItems[indexPath.row]
            cell.configureCell(data: data)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
