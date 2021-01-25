//
//  ChildVCsTable.swift
//  Knotive
//
//  Created by Muhammad Riaz on 05/01/2021.
//

import UIKit

struct NonTabVCTable {
    
    static func getNonTabVC(vcName stringValue: String) -> UIViewController {
        
        switch stringValue {
        case K.Main.Home.Feeds.searchVC.className:
            return K.Main.Home.Feeds.searchVC.vc!
        default:
            return K.Main.Home.Feeds.searchVC.vc!
        }
    }
}
