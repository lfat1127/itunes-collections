//
//  Album.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import ObjectMapper

class Album: Mappable {
    required init?(map: Map) {
        
    }
    
    var wrapperType: String?
    var collectionType: String?
    var artistId: Int?
    var collectionId: Int?
    var amgArtistId: Int?
    var artistName: String?
    var collectionName: String?
    var collectionCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: NSDecimalNumber?
    var collectionExplicitness: String?
    var trackCount: Int?
    var copyright: String?
    var country: String?
    var currency: String?
    var releaseDate: Date? //"2005-03-01T08:00:00Z"
    var primaryGenreName: String?
    
    func mapping(map: Map) {
        wrapperType <- map["wrapperType"]
        collectionType <- map["collectionType"]
        artistId <- map["artistId"]
        collectionId <- map["collectionId"]
        amgArtistId <- map["amgArtistId"]
        artistName <- map["artistName"]
        collectionName <- map["collectionName"]
        collectionCensoredName <- map["collectionCensoredName"]
        artistViewUrl <- map["artistViewUrl"]
        collectionViewUrl <- map["collectionViewUrl"]
        artworkUrl60 <- map["artworkUrl60"]
        artworkUrl100 <- map["artworkUrl100"]
        collectionPrice <- map["collectionPrice"]
        collectionExplicitness <- map["collectionExplicitness"]
        trackCount <- map["trackCount"]
        copyright <- map["copyright"]
        country <- map["country"]
        currency <- map["currency"]
        releaseDate <- (map["releaseDate"], DateTransform()) //"2005-03-01T08:00:00Z"
        primaryGenreName <- map["primaryGenreName"]
    }
}
