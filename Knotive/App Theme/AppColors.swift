//
//  AppColors.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

enum AppColors: String{
    case black = "AppBlack"
    case white = "AppWhite"
    case grayLight = "AppGrayLight"
    case grayMedium = "AppGrayMedium"
    case grayStrong = "AppGrayStrong"
    case grayVeryLight = "AppGrayVeryLight"
    case grayVeryStrong = "AppGrayVeryStrong"
    case grayDark = "AppGrayDark"
    case heavyDark = "AppGrayHeavyDark"
    case red = "AppRed"
    
    func color() -> UIColor {
        return UIColor(named: self.rawValue)!
    }
}
