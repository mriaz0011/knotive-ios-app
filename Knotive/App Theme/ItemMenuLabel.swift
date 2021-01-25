//
//  ItemMenuLabel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 15/01/2021.
//

import UIKit

class ItemMenuLabel: UILabel {
    
    @IBInspectable var setTextStyle: String = "mediumText"  {
        didSet {
            textStyled(style: setTextStyle)
            setNeedsLayout()
        }
    }
    
    private func textStyled(style: String) {
        switch style {
        case "feedTitle":
            font = FontBook.CrimsonTextSemiBold.of(size: 18)
            break
        case "extraLargeTitle":
            font = FontBook.SemiBold.of(size: 20)
            break
        case "largeTitle":
            font = FontBook.SemiBold.of(size: 18)
            break
        case "mediumTitle":
            font = FontBook.SemiBold.of(size: 16)
            break
        case "smallTitle":
            font = FontBook.SemiBold.of(size: 14)
            break
        case "verySmallTitle":
            font = FontBook.SemiBold.of(size: 12)
            break
        case "extraLargeText":
            font = FontBook.Regular.of(size: 18)
            break
        case "largeText":
            font = FontBook.Regular.of(size: 16)
            break
        case "mediumText":
            font = FontBook.Regular.of(size: 14)
            break
        case "smallText":
            font = FontBook.Regular.of(size: 12)
            break
        default:
            break
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        textStyled(style: setTextStyle)
    }
}
