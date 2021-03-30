//
//  DateFormatTransform.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation

import ObjectMapper

public class DateFormatTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = Double

    var dateFormat = DateFormatter()

    convenience init(_ format: String) {
        self.init()
        dateFormat.dateFormat = format
    }

    open func transformFromJSON(_ value: Any?) -> Date? {
        if let timeInt = value as? Double {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }

        if let timeStr = value as? String, let date = dateFormat.date(from: timeStr) {
            return date
        }
        return nil
    }

    open func transformToJSON(_ value: Date?) -> Double? {
        if let date = value {
            return Double(date.timeIntervalSince1970)
        }
        return nil
    }
}
