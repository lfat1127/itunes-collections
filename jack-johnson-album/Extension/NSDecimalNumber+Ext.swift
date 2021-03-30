//
//  NSDecimalNumber+Ext.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation

extension NSDecimalNumber {

    func getNumberStringValue(with minimumFractionDigits: Int = 1, maxFraction: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maxFraction
        formatter.usesGroupingSeparator = false
        formatter.roundingMode = .down
        formatter.numberStyle = .decimal
        return (formatter.string(from: self) ?? "")
    }
}
