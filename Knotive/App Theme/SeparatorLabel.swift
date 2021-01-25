//
//  SeparatorLabel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

@IBDesignable
class SeparatorLabel: UILabel {
    
    @IBInspectable var shadowSize: CGFloat = 4.0 {
        didSet {
            shadow()
        }
    }
    
    @IBInspectable var shadowDistance: CGFloat = 4.0 {
        didSet {
            shadow()
        }
    }
    
    @IBInspectable var bgColorShow: Bool = false {
        didSet {
            shadow()
        }
    }
    
    func shadow() {
        //Specialy working for separate line
        if !bgColorShow {
            backgroundColor = AppColors.white.color()
            setNeedsLayout()
        } else {
            backgroundColor = AppColors.white.color()
            let deviceWidth = ScreenSize.width
            let contactRect = CGRect(x: -shadowSize, y: self.frame.height - (shadowSize * 0.4) + shadowDistance, width: deviceWidth + shadowSize * 2, height: shadowSize)
            layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
            layer.shadowRadius = 5
            layer.shadowOpacity = 0.7
            setNeedsLayout()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        shadow()
    }
}
