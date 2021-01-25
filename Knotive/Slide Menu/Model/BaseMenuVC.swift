//
//  BaseMenuVC.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 22/12/2020.
//

import UIKit

class BaseMenuVC: UIViewController {
    
    let transiton = SlideInTransition()
}

extension BaseMenuVC: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
