//
//  JSON+Ext.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 4/4/2021.
//

import Foundation
import SwiftyJSON

extension JSON {
    func convertToDate(with dateFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self.stringValue) ?? Date()
    }
}
