//
//  JobsVideosVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class JobsVideosVC: UIViewController {
    
    let transiton = SlideInTransition()
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        guard let slideMenuVC = UIStoryboard(name: "SlideMenu", bundle: nil).instantiateViewController(withIdentifier: "SlideMenuVC") as? SlideMenuVC else { return }
        slideMenuVC.didTapMenuType = { item in
            TabBarsTable.goToSelectedTab(item)
        }
        slideMenuVC.modalPresentationStyle = .overCurrentContext
        slideMenuVC.transitioningDelegate = self
        present(slideMenuVC, animated: true)
    }
    
//    func transitionToNew(_ menuType: MenuList) {
//        let router = AppRouter()
//
//        switch menuType {
//        case .task:
//            router.showHomeFeeds()
//        case .chat:
//            router.showHomeChats()
//        case .workplace:
//            router.showWorkplaceHome()
//        }
//    }
}


extension JobsVideosVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
