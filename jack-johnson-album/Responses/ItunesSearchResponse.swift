//
//  ItunesSearchResponse.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import SwiftyJSON

// A generic response for iTunes Search
struct ItunesSearchResponse<T: Mappable>: Mappable {
    
    var resultCount: Int
    var results: [T]
    
    static func map(with json: JSON) -> ItunesSearchResponse<T> {
        return ItunesSearchResponse(resultCount: json["resultCount"].intValue,
                                    results: json["results"].arrayValue.map({ T.map(with: $0) }))
    }
}
