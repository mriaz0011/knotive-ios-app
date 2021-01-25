//
//  Extension+String.swift
//  Knotive
//
//  Created by Muhammad Riaz on 11/01/2021.
//

import UIKit

extension String {
    
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with: NSRange(location: 0, length: nsString.length > length ? length : nsString.length))
        }
        return  str + "…"
    }
    
    func getKM() -> String {
        guard let number: Int = Int(self) else { return self}
        
        if number >= 1000 && number < 10000 {
            return String(format: "%.1fK", Double(number/100)/10).replacingOccurrences(of: ".0", with: "")
        }
        if number >= 10000 && number < 1000000 {
            return "\(number/1000)k"
        }
        if number >= 1000000 && number < 10000000 {
            return String(format: "%.1fM", Double(number/100000)/10).replacingOccurrences(of: ".0", with: "")
        }
        if number >= 10000000 {
            return "\(number/1000000)M"
        }
        return String(self)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func timeAgo() -> String {
        
        let currentTime = Date().timeIntervalSince1970
        let date = Date(timeIntervalSince1970: Double(self) ?? currentTime)
        // From Time
        let fromDate = date
        // To Time
        let toDate = Date()

        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "yr ago" : "\(interval)" + " " + "yrs ago"
        }
        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "mth ago" : "\(interval)" + " " + "mths ago"
        }
        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "d ago" : "\(interval)" + " " + "ds ago"
        }
        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "hr ago" : "\(interval)" + " " + "hrs ago"
        }
        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "min ago" : "\(interval)" + " " + "mins ago"
        }
        return "a moment ago"
    }
}
