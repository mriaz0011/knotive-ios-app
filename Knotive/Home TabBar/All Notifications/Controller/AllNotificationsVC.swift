//
//  AllNotificationsVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

class AllNotificationsVC:  BaseMenuVC {
    
    class var storyboardID: String {
        return "AllNotificationsVC"
    }
    class var storyboardName: String {
        return "AllNotifications"
    }
    
    var notificationItems: [NotificationsTVCellModel] = []
    private var lastContentOffset: CGFloat = 0
    
    @IBOutlet weak var notificationsTV: UITableView!
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navView: UIStackView!
//    @IBOutlet weak var notificationsMenuCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationsTV.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TabBarsTable.main?.tabBar.isHidden = true
        dummyDataOfNotifications()
        setupTableView()
    }
    
    private func setupTableView() {
        
        notificationsTV.delegate = self
        notificationsTV.dataSource = self
        notificationsTV.register(UINib(nibName: NotificationsTVCell.nibName, bundle: nil), forCellReuseIdentifier: NotificationsTVCell.reuseIdentifier)
    }
    
    private func goToSelectedChildVC(vcName: String) {
        
        let vc = NonTabVCTable.getNonTabVC(vcName: vcName)
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func unwindToHomeExplore(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllNotificationsVC: UIScrollViewDelegate {
    
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

extension AllNotificationsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notificationItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        if let cell = notificationsTV.dequeueReusableCell(withIdentifier: NotificationsTVCell.reuseIdentifier, for: indexPath) as? NotificationsTVCell {
            //, for: indexPath) as! SlideMenuTableCell
            // set the text from the data model
            let data = notificationItems[indexPath.row]
            cell.mainTabItem.image = UIImage(named: TabBarsTable.tabImageName(data.messageTabBar))
            cell.mainTabItem.setImageColor(color: .darkGray)
            cell.itemName.text = data.messageType
            cell.receivedTime.text = data.receiveTime
            cell.senderName.text = data.sender
            cell.messageContent.text = data.messageContent
            if data.messageImage == "" {
                cell.messageImgWidthConst.constant = 0
            } else {
                cell.messageImgWidthConst.constant = 45
                cell.messageImage.image = UIImage(named: data.messageImage)
                if data.isImageCircle == "Yes" {
                    cell.messageImage.makeRounded()
                } else {
                    cell.messageImage.makeSquare()
                }
            }
            
            cell.deleteCellDelegate = self
            cell.deleteBtn.tag = indexPath.row
            
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
        
        let data = notificationItems[indexPath.row]
//        let tabIndexes = TabBarsTable.getTabIndexes(main: data.messageTabBar, sub: data.messageType)
        if data.childVCName != "" {
            goToSelectedChildVC(vcName: data.childVCName)
        } else {
            //
        }
    }
}

extension AllNotificationsVC: NotificationsTVCellDelegate {
    
    func deleteCellPressButton(_ tag: Int) {
        notificationItems.remove(at: tag)
        notificationsTV.reloadData()
    }
}

extension AllNotificationsVC {
    
    func dummyDataOfNotifications() {
        notificationItems = [NotificationsTVCellModel(messageTabBar: "Home", messageType: "Feeds", childVCName: "HomeFeedsSearchVC", receiveTime: "3m ago", sender: "Misssed Call", messageContent: "You missed a call from Alice Wonder", messageImage: "profile_photo_1", isImageCircle: "Yes"),
                             NotificationsTVCellModel(messageTabBar: "Groups", messageType: "Eevents", childVCName: "", receiveTime: "Yesterday", sender: "Michael David", messageContent: "Posted a new video", messageImage: "dentist_room", isImageCircle: "No"),
                             NotificationsTVCellModel(messageTabBar: "Rooms", messageType: "Videos", childVCName: "", receiveTime: "2 days ago", sender: "Internation Debates", messageContent: "emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line emo demo line ", messageImage: "", isImageCircle: "No")
        ]
    }
}
