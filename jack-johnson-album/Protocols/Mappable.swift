//
//  Mappable.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 4/4/2021.
//

import Foundation
import SwiftyJSON

protocol Mappable {
    static func map(with json: JSON) -> Self
}
