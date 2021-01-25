//
//  HomeFeedsSearchVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 31/12/2020.
//

import UIKit

class HomeFeedsSearchVC: UIViewController {

    let doINeedData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToSelectedVC(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "unwindHomeFeedsVC", sender: self)
        
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
