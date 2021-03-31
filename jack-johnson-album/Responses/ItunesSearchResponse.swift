//
//  ItunesSearchResponse.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import ObjectMapper

// A generic response for iTunes Search
class ItunesSearchResponse<T: Mappable>: Mappable {
    var resultCount: Int64?
    var results: [T]?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
