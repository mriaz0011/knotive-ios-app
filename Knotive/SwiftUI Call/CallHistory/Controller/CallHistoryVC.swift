//
//  CallHistoryVC.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 23/12/2020.
//

import UIKit

class CallHistoryVC: BaseMenuVC {
    
    @IBAction func goToHomeContact(_ sender: UIButton) {
//        SubTabBars.home?.selectedIndex = 2
//        RouteTable.Home.showHomeExplore(.contactsListVC)
        self.performSegue(withIdentifier: "unwindToHomeExplore", sender: self)
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
