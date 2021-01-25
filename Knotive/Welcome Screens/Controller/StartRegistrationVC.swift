//
//  StartRegistrationVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 06/01/2021.
//

import UIKit

class StartRegistrationVC: UIViewController {
    
    var age: Int = 0
    let router = WindowRouter()
    
    @IBOutlet weak var accountsBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatePassword: UITextField!
    @IBOutlet weak var termsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.text = GetStartedModel.RegistrationVC.email
        password.text = GetStartedModel.RegistrationVC.password
        repeatePassword.text = GetStartedModel.RegistrationVC.repeatPassword
        age = 18
        
        if GetStartedModel.anyAddedAccounts {
            accountsBtn.isHidden = false
        } else {
            accountsBtn.isHidden = true
        }
        
        // Do any additional setup after loading the view.
        let attributedTitle = NSMutableAttributedString(string: "By submitting you certify that you are over 18 years of age and you agree to our ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "Terms of Service ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        attributedTitle.append(NSAttributedString(string: "and ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
        attributedTitle.append(NSAttributedString(string: "Privacy Policy", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        termsBtn.setAttributedTitle(attributedTitle, for: .normal)
        
        let attributedTitle3 = NSMutableAttributedString(string: "Already have an added account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle3.append(NSAttributedString(string: "Accounts", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        accountsBtn.setAttributedTitle(attributedTitle3, for: .normal)
        
        let attributedTitle2 = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle2.append(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        loginBtn.setAttributedTitle(attributedTitle2, for: .normal)
    }
    
    @IBAction func goToAccountsAction(_ sender: UIButton) {
        
        router.showAccounts()
    }
    
    @IBAction func goToLoginAction(_ sender: UIButton) {
        
        router.showStartLogin()
    }
    
    @IBAction func goToTermsAction(_ sender: UIButton) {
                
        
    }
    
    @IBAction func goToSetDetailsAction(_ sender: UIButton) {
        
        router.showSetDetails()
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
