//
//  EssentialButton.swift
//  Knotive
//
//  Created by Muhammad Riaz on 07/01/2021.
//

import UIKit

@IBDesignable
class EssentialButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = AppColors.white.color() {
        didSet {
            layer.borderColor = borderColor.cgColor
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
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
