//
//  AccountsVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 07/01/2021.
//

import UIKit

class AccountsVC: UIViewController {
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    var userAccountsList: [AddedUserAccountModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: "AccountsTableCell", bundle: nil), forCellReuseIdentifier: "AccountsTableCell")
        
        // Do any additional setup after loading the view.
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        registerBtn.setAttributedTitle(attributedTitle, for: .normal)
        
        dummyDataOfLists()
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

//MARK: - Buttons Actions
extension AccountsVC: AccountsCellDelegate {
    
    func deleteCellPressButton(_ tag: Int) {
        userAccountsList.remove(at: tag)
        usersTableView.reloadData()
    }
    
    @IBAction func goToMainAppAction(_ sender: UIButton) {
        let router = WindowRouter()
        router.showMainApp()
    }
    
    @IBAction func loginToAnotherAccAction(_ sender: UIButton) {
        let router = WindowRouter()
        router.showStartLogin()
    }
    
    @IBAction func goToRegistrationAction(_ sender: UIButton) {
        
        let router = WindowRouter()
        router.showStartRegistration()
    }
}

extension AccountsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAccountsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsTableCell") as! AccountsTableCell
        //, for: indexPath) as! SlideMenuTableCell
        // set the text from the data model
        let data = userAccountsList[indexPath.row]
        cell.profilePhotoImg.image = UIImage(named: data.userPhotoName)
        cell.profilePhotoImg.makeRounded()
        cell.userNameLbl.text = data.userName
        
        cell.deleteCellDelegate = self
        cell.removeBtn.tag = indexPath.row
        if data.isProfile == "Yes" {
            cell.removeBtn.isHidden = false
        } else {
            cell.removeBtn.isHidden = true
        }
        
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
        let router = WindowRouter()
//        let data = notificationItems[indexPath.row]
        let data = userAccountsList[indexPath.row]
        if data.isProfile == "Yes" {
            router.showMainApp()
        } else {
            router.showStartLogin()
        }
        
    }
}

extension AccountsVC {
    private func dummyDataOfLists() {
        
        userAccountsList = [AddedUserAccountModel(userName: "Jack Danial", userPhotoName: "profile_photo_1", isProfile: "Yes"), AddedUserAccountModel(userName: "Gold Smith", userPhotoName: "profile_photo_2", isProfile: "Yes"), AddedUserAccountModel(userName: "Add another account", userPhotoName: "icons8-add-administrator-2", isProfile: "No")]
    }
}
