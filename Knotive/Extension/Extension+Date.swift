//
//  Extension+Date.swift
//  Knotive
//
//  Created by Muhammad Riaz on 12/01/2021.
//

import Foundation

extension Date {
    
    func secondsString() -> String {
        let secondsString = String(self.timeIntervalSince1970)
        return secondsString
    }
}
