//
//  EssentialLabel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 09/01/2021.
//

import UIKit

@IBDesignable
class EssentialLabel: UILabel {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadow: Bool = false {
        didSet {
            shadowed()
        }
    }
    
    @IBInspectable var setTextStyle: String = "mediumText"  {
        didSet {
            textStyled(style: setTextStyle)
            setNeedsLayout()
        }
    }
    
    func getTextHeight() -> CGFloat {
        sizeToFit()
        return self.frame.height
    }
    
    @IBInspectable var setRounded: Bool = false {
        didSet {
            rounded()
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
    
    private func shadowed() {
        if shadow {
            layer.sketchShadow()
        }
    }
    
    private func rounded() {
        
        if setRounded {
            self.layer.borderWidth = 1
            self.layer.masksToBounds = false
            self.layer.borderColor = UIColor.white.cgColor
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        rounded()
        shadowed()
        textStyled(style: setTextStyle)
    }
}
