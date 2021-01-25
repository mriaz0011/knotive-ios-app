//
//  EssentialImageView.swift
//  Knotive
//
//  Created by Muhammad Riaz on 09/01/2021.
//

import UIKit

@IBDesignable
class EssentialImageView: UIImageView {
    
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
    
    @IBInspectable var round: Bool = false {
        didSet {
            layer.borderWidth = 1
            layer.masksToBounds = false
            layer.borderColor = AppColors.white.color().cgColor
            layer.cornerRadius = self.frame.height / 2
            clipsToBounds = true
        }
    }
    
    @IBInspectable var square: Bool = false {
        didSet {
            layer.borderWidth = 1
            layer.masksToBounds = false
            layer.borderColor = AppColors.white.color().cgColor
            layer.cornerRadius = 4
            clipsToBounds = true
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
