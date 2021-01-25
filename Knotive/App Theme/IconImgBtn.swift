//
//  KnotiveBtn.swift
//  Knotive
//
//  Created by Muhammad Riaz on 04/01/2021.
//

import UIKit

@IBDesignable
class IconImgBtn: UIButton {
    
    @IBInspectable var strokeColor : UIColor = AppColors.black.color() {
        didSet {
            update()
        }
    }
    
    @IBInspectable var strokeSize : CGFloat = 0.0 {
        didSet {
            update()
        }
    }
    
    private func update() {
        self.setImage(currentImage!.stroked(with: strokeColor, thickness: strokeSize, quality: 0.0).colorized(with: strokeColor), for: .normal)
        setNeedsLayout()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        update()
    }
}
