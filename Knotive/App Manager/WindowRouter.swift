//
//  WindowRouter.swift
//  Knotive
//
//  Created by Muhammad Riaz on 01/01/2021.
//

import UIKit
import LocalAuthentication

struct WindowRouter {
    
    private var window: UIWindow?? {
        return UIApplication.shared.delegate?.window
    }
    
    private func clear(_ window: UIWindow??) {
        window??.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func logoutUser() {
        
        clear(window)
        showAccounts()
    }
    
    func showMainApp() {
        
        clear(window)
        let vc = UIStoryboard(name: "MainApp", bundle: nil).instantiateInitialViewController()
        window??.rootViewController = vc
    }
    
    func showAccounts() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountsVC") as? AccountsVC
        window??.rootViewController = vc
    }
    
    func showStartLogin() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartLoginVC") as? StartLoginVC
        window??.rootViewController = vc
    }
    
    func showStartRegistration() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartRegistrationVC") as? StartRegistrationVC
        window??.rootViewController = vc
    }
    
    func showSetDetails() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetDetailsVC") as? SetDetailsVC
        window??.rootViewController = vc
    }
}
