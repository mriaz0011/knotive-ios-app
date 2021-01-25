//
//  Extension+CGPoint.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

extension CGPoint {
    /**
     Rotates the point from the center `origin` by `byDegrees` degrees along the Z axis.
     
     - Parameters:
     - origin: The center of he rotation;
     - byDegrees: Amount of degrees to rotate around the Z axis.
     
     - Returns: The rotated point.
     */
    func rotated(around origin: CGPoint, byDegrees: CGFloat) -> CGPoint {
        let dx = x - origin.x
        let dy = y - origin.y
        let radius = sqrt(dx * dx + dy * dy)
        let azimuth = atan2(dy, dx) // in radians
        let newAzimuth = azimuth + byDegrees * .pi / 180.0 // to radians
        let x = origin.x + radius * cos(newAzimuth)
        let y = origin.y + radius * sin(newAzimuth)
        return CGPoint(x: x, y: y)
    }
}

extension CALayer {
    func sketchShadow(color: UIColor = .white, alpha: Float = 0.4, x: CGFloat = -20, y: CGFloat = 0, blur: CGFloat = 20, spread: CGFloat = 0.1)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
