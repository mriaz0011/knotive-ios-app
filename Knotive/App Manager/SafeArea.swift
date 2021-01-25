//
//  SafeArea.swift
//  Knotive
//
//  Created by Muhammad Riaz on 03/01/2021.
//

import UIKit

struct SafeArea {
    
    static var top: CGFloat?
    static var bottom: CGFloat?
    static var left: CGFloat?
    static var right: CGFloat?
    
    static var navigationHeight: CGFloat?
}

struct ScreenSize {
    
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static var navigationHeight: CGFloat?
}
