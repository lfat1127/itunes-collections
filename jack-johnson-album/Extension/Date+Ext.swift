//
//  Date+Ext.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation

extension Date {
    
    // MARK: convert date to string with given format
    func getDateStr(with format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
