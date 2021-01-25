//
//  MainTabBarVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let transiton = SlideInTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarsTable.main = self
        addLeftAndRightEdgePan()
        SafeArea.navigationHeight =  navigationController?.navigationBar.frame.height ?? 44.0
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
            print("Tabbar Left edge swiped!")
            guard let slideMenuVC = UIStoryboard(name: "SlideMenu", bundle: nil).instantiateViewController(withIdentifier: "SlideMenuVC") as? SlideMenuVC else { return }
            slideMenuVC.didTapMenuType = { item in
                TabBarsTable.goToSelectedTab(item)
            }
            slideMenuVC.modalPresentationStyle = .overCurrentContext
            slideMenuVC.transitioningDelegate = self
            present(slideMenuVC, animated: true)
        }
    }
    
    @objc func rightEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Tabbar Right edge swiped!")
        }
    }
}

extension MainTabBarController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
