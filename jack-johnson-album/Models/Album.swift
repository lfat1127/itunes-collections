//
//  Album.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

class Album: Object, Mappable {
    var wrapperType: String = ""
    var collectionType: String = ""
    var artistId: Int = 0
    var collectionId: Int = 0
    var amgArtistId: Int = 0
    var artistName: String = ""
    var collectionName: String = ""
    var collectionCensoredName: String = ""
    var artistViewUrl: String = ""
    var collectionViewUrl: String = ""
    var artworkUrl60: String = ""
    var artworkUrl100: String = ""
    var collectionPrice: NSDecimalNumber = NSDecimalNumber()
    var collectionExplicitness: String = ""
    var trackCount: Int = 0
    var copyright: String = ""
    var country: String = ""
    var currency: String = ""
    var releaseDate: Date = Date() //"2005-03-01T08:00:00Z"
    var primaryGenreName: String = ""
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
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
