//
//  ContactVC.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 28/12/2020.
//

import UIKit
import SwiftUI

class ContactVC: UIViewController {
//    @IBOutlet weak var theContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let childView = UIHostingController(rootView: ContactUI())
        addChild(childView)
        childView.view.frame = self.view.bounds
        self.view.addConstrained(subview: childView.view)
        childView.didMove(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func unwindToContact(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}
