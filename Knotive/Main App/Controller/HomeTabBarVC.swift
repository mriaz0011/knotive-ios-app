//
//  HomeTabBarVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 30/12/2020.
//

import UIKit

class HomeTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarsTable.home = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
