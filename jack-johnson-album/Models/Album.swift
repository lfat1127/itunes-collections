//
//  Album.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import ObjectMapper
import RealmSwift

class Album: Object, Mappable {
    required convenience init?(map: Map) {
        self.init()
    }
    
    @objc dynamic var wrapperType: String = ""
    @objc dynamic var collectionType: String = ""
    @objc dynamic var artistId: Int = 0
    @objc dynamic var collectionId: Int = 0
    @objc dynamic var amgArtistId: Int = 0
    @objc dynamic var artistName: String = ""
    @objc dynamic var collectionName: String = ""
    @objc dynamic var collectionCensoredName: String = ""
    @objc dynamic var artistViewUrl: String = ""
    @objc dynamic var collectionViewUrl: String = ""
    @objc dynamic var artworkUrl60: String = ""
    @objc dynamic var artworkUrl100: String = ""
    @objc dynamic var collectionPrice: Double = 0
    @objc dynamic var collectionExplicitness: String = ""
    @objc dynamic var trackCount: Int = 0
    @objc dynamic var copyright: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var currency: String = ""
    @objc dynamic var releaseDate: Date = Date() //"2005-03-01T08:00:00Z"
    @objc dynamic var primaryGenreName: String = ""
    
    @objc dynamic var bookmarked: Bool = false
    
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
        releaseDate <- (map["releaseDate"], DateFormatTransform("yyyy-MM-dd'T'HH:mm:ss'Z'")) //"2005-03-01T08:00:00Z"
        primaryGenreName <- map["primaryGenreName"]
    }
}
