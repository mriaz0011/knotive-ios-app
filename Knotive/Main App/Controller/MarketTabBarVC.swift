//
//  MarketTabBarVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

class MarketTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarsTable.market = self
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
