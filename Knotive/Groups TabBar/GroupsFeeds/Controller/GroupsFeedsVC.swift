//
//  GroupsFeedsVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class GroupsFeedsVC: BaseMenuVC {
    
    
    private var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TabBarsTable.main?.tabBar.isHidden = true
    }
    
    
    @IBAction func goToTab2(_ sender: UIButton) {
        performSegue(withIdentifier: K.Main.Home.Feeds.searchVC.segue, sender: nil)
        
    }
    
    @IBAction func unwindToHomeFeeds(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
//        if let sourceViewController = unwindSegue.source as? HomeFeedsSearchVC {
//            print(sourceViewController.simpleString)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Main.Home.Feeds.searchVC.segue {
                if let feedsSearchVC = segue.destination as? HomeFeedsSearchVC {
                    _ = feedsSearchVC.doINeedData ? print("Yes Pass Data") : print("No Need To Pass Data")
                }
            }
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
