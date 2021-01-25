//
//  StartLoginVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 06/01/2021.
//

import UIKit

class StartLoginVC: UIViewController {

    @IBOutlet weak var accountsBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.text = GetStartedModel.LoginVC.email
        password.text = GetStartedModel.LoginVC.password
        
        // Do any additional setup after loading the view.
        if GetStartedModel.anyAddedAccounts {
            accountsBtn.isHidden = false
        } else {
            accountsBtn.isHidden = true
        }
        
        //For Added Accounts
        let attributedTitle2 = NSMutableAttributedString(string: "Already have an added account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle2.append(NSAttributedString(string: "Accounts", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        accountsBtn.setAttributedTitle(attributedTitle2, for: .normal)
        
        
        //For Register Button
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        registerBtn.setAttributedTitle(attributedTitle, for: .normal)
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
extension StartLoginVC {
    
    @IBAction func goToMainAppAction(_ sender: UIButton) {
        let router = WindowRouter()
        router.showMainApp()
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        
    }
    
    @IBAction func goToAccountsAction(_ sender: UIButton) {
        
        let router = WindowRouter()
        router.showAccounts()
    }
    
    @IBAction func goToRegistrationAction(_ sender: UIButton) {
        
        GetStartedModel.LoginVC.email = email.text!
        GetStartedModel.LoginVC.password = password.text!
        
        let router = WindowRouter()
        router.showStartRegistration()        
    }
}
