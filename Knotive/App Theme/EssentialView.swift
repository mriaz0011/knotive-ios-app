//
//  EssentialView.swift
//  Knotive
//
//  Created by Muhammad Riaz on 06/01/2021.
//

import UIKit

@IBDesignable
class EssentialView: UIView {
    
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
    
    @IBInspectable var topColor: UIColor = AppColors.white.color() {
        didSet {
            //
        }
    }
    
    @IBInspectable var bottomColor: UIColor = AppColors.black.color() {
        didSet {
            //
        }
    }
    
    @IBInspectable var dropShadow: Int  = 0 {
        didSet {
            shadow()
        }
    }
    
    @IBInspectable var setShadow: Bool = false {
        didSet {
            //
        }
    }
    
    private func shadow() {
        if setShadow {
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 0, height: dropShadow) //-17 for watching cell
            layer.shadowOpacity = 0.6
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var gradient: Bool = false {
        didSet {
            if gradient {
                cornerRadius = 16
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.locations = [0, 1]
                gradientLayer.frame = bounds
                gradientLayer.cornerRadius = layer.cornerRadius
                layer.insertSublayer(gradientLayer, at: 0)
                setNeedsLayout()
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        shadow()
    }
}

