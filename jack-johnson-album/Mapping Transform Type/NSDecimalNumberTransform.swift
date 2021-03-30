//
//  NSDecimalNumberTransform.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation
import ObjectMapper

class NSDecimalNumberTransform: TransformType {
    public typealias Object = NSDecimalNumber
    public typealias JSON = Double

    let formatter = NumberFormatter()
    
    var maximumFractionDigits = 0

    convenience init(_ maximumFractionDigits: Int) {
        self.init()
        self.maximumFractionDigits = maximumFractionDigits
    }

    open func transformFromJSON(_ value: Any?) -> NSDecimalNumber? {
        formatter.generatesDecimalNumbers = true
        formatter.usesGroupingSeparator = false
        formatter.numberStyle = .decimal
        formatter.roundingMode = .down
        formatter.maximumFractionDigits = 2
        if let doubleValue = value as? Double {
            return NSDecimalNumber(value: doubleValue)
        }
        return nil
    }

    open func transformToJSON(_ value: NSDecimalNumber?) -> Double? {
        if let number = value {
            return Double(truncating: number)
        }
        return nil
    }
}
