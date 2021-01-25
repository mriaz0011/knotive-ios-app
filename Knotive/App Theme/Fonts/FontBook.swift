//
//  FontBook.swift
//  Knotive
//
//  Created by Muhammad Riaz on 03/01/2021.
//

import UIKit

enum FontBook: String {
    
    case Light = "OpenSans-Light"
    case LightItalic = "OpenSans-LightItalic"
    case Regular = "OpenSans-Regular"
    case RegularItalic = "OpenSans-Italic"
    case SemiBold = "OpenSans-SemiBold"
    case SemiBoldItalic = "OpenSans-SemiBoldItalic"
    case CrimsonTextSemiBold = "CrimsonText-SemiBold"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
