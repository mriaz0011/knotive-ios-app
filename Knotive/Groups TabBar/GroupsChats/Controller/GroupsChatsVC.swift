//
//  GroupsChatsVC.swift
//  SlideInTransition
//
//  Created by Muhammad Riaz on 22/12/2020.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class GroupsChatsVC: BaseMenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
