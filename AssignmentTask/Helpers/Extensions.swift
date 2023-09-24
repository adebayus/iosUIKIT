//
//  extenstions.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import Foundation
import UIKit

extension Int {
    
    func formatToIDRCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
        formatter.currencySymbol = "Rp"
        formatter.maximumFractionDigits = 0
        
        // Custom separators
        formatter.groupingSeparator = "."
        
        return formatter.string(from: NSNumber(value: self))
        
    }
}

extension UICollectionViewCell {
    static func getReusableId() -> String {
        return String(describing: self)
    }
}
