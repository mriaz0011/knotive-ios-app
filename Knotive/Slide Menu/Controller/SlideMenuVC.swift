//
//  SlideMenuVC.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 23/12/2020.
//

import UIKit

class SlideMenuVC: UIViewController {
    
    class var storyboardID: String {
        return "SlideMenuVC"
    }
    class var storyboardName: String {
        return "SlideMenu"
    }
    
    var didTapMenuType: ((TabIndexes) -> Void)?
//    var notificationItems: [HomeNotificationsTVCellModel] = []
    var homeListItems: [MenuListCellData] = []
    var groupsListItems: [MenuListCellData] = []
    var jobsListItems: [MenuListCellData] = []
    var marketListItems: [MenuListCellData] = []
    var roomsItems: [MenuListCellData] = []
    var isMenuListSelected: Bool = true
    
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    @IBOutlet var dismissView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        dummyDataOfNotifications()
        dummyDataOfLists()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
//        menuTableView.register(UINib(nibName: K.menuNotificationCellNibName, bundle: nil), forCellReuseIdentifier: K.menuNotificationCell)
        menuTableView.register(UINib(nibName: K.menuListCellNibName, bundle: nil), forCellReuseIdentifier: K.menuListCell)
        menuTableView.register(MenuListHeaderView.nib, forHeaderFooterViewReuseIdentifier: MenuListHeaderView.identifier)
        
        addLeftAndRightEdgePan()
        addViewAction()
        navViewHeight.constant = (SafeArea.top ?? 40.0) + (SafeArea.navigationHeight ?? 44.0)
    }
    
    
    
    private func addViewAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissThisVC))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        dismissView.addGestureRecognizer(tapGesture)
        dismissView.isUserInteractionEnabled = true
    }
    
    private func addLeftAndRightEdgePan() {
        let leftEdgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(leftEdgeSwiped))
        leftEdgePan.edges = .left
        view.addGestureRecognizer(leftEdgePan)
        
        let rightEdgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(rightEdgeSwiped))
        rightEdgePan.edges = .right
        view.addGestureRecognizer(rightEdgePan)
    }
    
    @objc func leftEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Menu Left edge swiped!")
        }
    }
    
    @objc func rightEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            dismissThisVC()
            print("Menu Right edge swiped!")
        }
    }
    
    @objc func dismissThisVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SlideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionHeight = CGFloat(isMenuListSelected ? 40.0 : 0.0)
        return sectionHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isMenuListSelected {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isMenuListSelected {
            return 55.0
        } else {
            return 113.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMenuListSelected {
            switch section {
            case 0:
                return homeListItems.count
            case 1:
                return groupsListItems.count
            case 2:
                return 0
            case 3:
                return 0
            case 4:
                return 0
            default:
                return 0
            }
        } else {
//            return notificationItems.count
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isMenuListSelected {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuListHeaderView.identifier) as? MenuListHeaderView
            switch section {
            case 0:
                headerView?.imageView.image = UIImage(named: TabBarsTable.tabImageName("Home"))
                headerView?.imageView.setImageColor(color: .darkGray)
                headerView!.titleNAme.text = "Home"
                return headerView
            case 1:
                headerView?.imageView.image = UIImage(named: TabBarsTable.tabImageName("Groups"))
                headerView?.imageView.setImageColor(color: .darkGray)
                headerView!.titleNAme.text = "Groups"
                return headerView
            case 2:
                headerView?.imageView.image = UIImage(named: TabBarsTable.tabImageName("Jobs"))
                headerView?.imageView.setImageColor(color: .darkGray)
                headerView!.titleNAme.text = "Jobs"
                return headerView
            case 3:
                headerView?.imageView.image = UIImage(named: TabBarsTable.tabImageName("Market"))
                headerView?.imageView.setImageColor(color: .darkGray)
                headerView!.titleNAme.text = "Market"
                return headerView
            case 4:
                headerView?.imageView.image = UIImage(named: TabBarsTable.tabImageName("Rooms"))
                headerView?.imageView.setImageColor(color: .darkGray)
                headerView!.titleNAme.text = "Rooms"
                return headerView
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        if isMenuListSelected {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.menuListCell) as! MenuListCell
            switch indexPath.section {
            case 0:
                let data = homeListItems[indexPath.row]
                cell.iconView.image = UIImage(named: data.vcTypeImage)?.colorized(with: .darkGray)
                cell.childVCName.text = data.title
                break
            case 1:
                let data = groupsListItems[indexPath.row]
                cell.iconView.image = UIImage(named: data.vcTypeImage)?.colorized(with: .darkGray)
                cell.childVCName.text = data.title
                break
            case 2:
                break
            case 3:
                break
            case 4:
                break
            default:
                break
            }
            cell.selectionStyle = .none
            return cell
        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: HomeNotificationsTVCell.reuseIdentifier) as! HomeNotificationsTVCell
//            //, for: indexPath) as! SlideMenuTableCell
//            // set the text from the data model
//            let data = notificationItems[indexPath.row]
//            cell.mainTabItem.image = UIImage(named: TabBarsTable.tabImageName(data.messageTabBar))
//            cell.mainTabItem.setImageColor(color: .darkGray)
//            cell.itemName.text = data.messageType
//            cell.receivedTime.text = data.receiveTime
//            cell.senderName.text = data.sender
//            cell.messageContent.text = data.messageContent
//            if data.messageImage == "" {
//                cell.messageImgWidthConst.constant = 0
//            } else {
//                cell.messageImgWidthConst.constant = 40
//                cell.messageImage.image = UIImage(named: data.messageImage)
//                if data.isImageCircle == "Yes" {
//                    cell.messageImage.makeRounded()
//                } else {
//                    cell.messageImage.makeSquare()
//                }
//            }
//
//            cell.deleteCellDelegate = self
//            cell.deleteBtn.tag = indexPath.row
//
//            cell.selectionStyle = .none
//            return cell
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
        
        if isMenuListSelected {
            switch indexPath.section {
            case 0:
                let data = homeListItems[indexPath.row]
                let tabIndexes = data.tabIndexes
                if data.isVCNonTab == "No" {
                    dismiss(animated: true) { [weak self] in
                        self?.didTapMenuType?(tabIndexes)
                    }
                } else {
                    goToSelectedChildVC(vcName: data.vcName)
                }
                break
            case 1:
                let data = groupsListItems[indexPath.row]
                let tabIndexes = data.tabIndexes
                if data.isVCNonTab == "No" {
                    dismiss(animated: true) { [weak self] in
                        self?.didTapMenuType?(tabIndexes)
                    }
                } else {
                    goToSelectedChildVC(vcName: data.vcName)
                }
                break
            case 2:
                break
            case 3:
                break
            case 4:
                break
            default:
                break
            }
        } else {
//            let data = notificationItems[indexPath.row]
//            let tabIndexes = TabBarsTable.getTabIndexes(main: data.messageTabBar, sub: data.messageType)
//            if data.childVCName != "" {
//                goToSelectedChildVC(vcName: data.childVCName)
//            } else {
//                dismiss(animated: true) { [weak self] in
//                    self?.didTapMenuType?(tabIndexes)
//                }
//            }
        }
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .normal, title: "Clear") { (action, view, completion) in
//            // Perform your action here
//            self.notificationItems.remove(at: indexPath.row)
//            self.menuTableView.reloadData()
//            completion(true)
//        }
//
//
//        //deleteAction.image = UIImage(named: "icons8-cancel-1")
//        deleteAction.backgroundColor = UIColor.clear
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
}

//MARK: - Buttons Actions
extension SlideMenuVC {
    
    private func goToSelectedChildVC(vcName: String) {
        
        let vc = NonTabVCTable.getNonTabVC(vcName: vcName)
        self.present(vc, animated: false, completion: nil)
    }
    
    private func logoutAlert() {
        
        let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
                
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            //
        }

        let logoutAction = UIAlertAction(title: "Logout", style: .default) { (action:UIAlertAction) in
            let router = WindowRouter()
            router.logoutUser()
        }

        alertController.addAction(cancelAction)
        alertController.addAction(logoutAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
//        logoutAlert()
        GetStartedModel.anyAddedAccounts = true
        let router = WindowRouter()
        router.logoutUser()
    }
    
    @IBAction func closeMenuAction(_ sender: UIButton) {
        dismissThisVC()
    }
    
    //Action for main tab buttons
    @IBAction func menuButtons(_ sender: UIButton) {
        let menuItem = TabIndexes(main: sender.tag, sub: 5)
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuItem)")
            self?.didTapMenuType?(menuItem)
        }
    }
}

//MARK: - Table Data
extension SlideMenuVC {
    
    private func dummyDataOfLists() {
        
        homeListItems = [MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 0, sub: 0), vcName: "", title: "Feeds: you can view latest posts here", vcTypeImage: "icons8-home-1"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 0, sub: 1), vcName: "", title: "Chats: you can view latest messages here", vcTypeImage: "icons8-topic"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 0, sub: 2), vcName: "", title: "Videos: you can view history of your video calls here", vcTypeImage: "icons8-video-call"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 0, sub: 3), vcName: "", title: "Explore: you can find your interests here", vcTypeImage: "icons8-hash"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 0, sub: 4), vcName: "", title: "Events: you can check events here in which you are going", vcTypeImage: "icons8-planner"),MenuListCellData(isVCNonTab: "Yes", tabIndexes: TabIndexes(main: 0, sub: 0), vcName: "HomeFeedsSearchVC", title: "Search Feeds: you can search your particular feeds you are looking for", vcTypeImage: "icons8-search-more")]
        
        groupsListItems = [MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 1, sub: 0), vcName: "", title: "Feeds: you can view latest group posts here", vcTypeImage: "icons8-user-groups"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 1, sub: 1), vcName: "", title: "Chats: you can view latest group messages here", vcTypeImage: "icons8-topic"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 1, sub: 2), vcName: "", title: "Explore: you can find your interests here", vcTypeImage: "icons8-hash"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 1, sub: 3), vcName: "", title: "Events: you can check events here in which you are going", vcTypeImage: "icons8-planner"), MenuListCellData(isVCNonTab: "No", tabIndexes: TabIndexes(main: 1, sub: 4), vcName: "", title: "Videos: you can view history of your coneference calls here", vcTypeImage: "icons8-video-call")]
    }
    
//    func dummyDataOfNotifications() {
//        notificationItems = [HomeNotificationsTVCellModel(messageTabBar: "Home", messageType: "Feeds", childVCName: "HomeFeedsSearchVC", receiveTime: "3m ago", sender: "Misssed Call", messageContent: "You missed a call from Alice Wonder", messageImage: "profile_photo_1", isImageCircle: "Yes"),
//                             HomeNotificationsTVCellModel(messageTabBar: "Groups", messageType: "Eevents", childVCName: "", receiveTime: "Yesterday", sender: "Michael David", messageContent: "Posted a new video", messageImage: "dentist_room", isImageCircle: "No"),
//                             HomeNotificationsTVCellModel(messageTabBar: "Rooms", messageType: "Videos", childVCName: "", receiveTime: "2 days ago", sender: "Internation Debates", messageContent: "emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line ", messageImage: "", isImageCircle: "No")
//        ]
//    }
}
