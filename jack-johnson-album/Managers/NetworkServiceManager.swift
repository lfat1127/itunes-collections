//
//  NetworkService.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift
import Alamofire

// MARK: Handle different Api request here
class NetworkServiceManager {
    // MARK: Search Itunes
    static func searchItunes(with term: String = "jack johnson", entity: String = "album") -> Observable<ItunesSearchResponse<iTunesCollection>> {
        return NetworkService<ItunesSearchResponse<iTunesCollection>>()
            .get(url: "https://itunes.apple.com/search",
                 params: ["term": term, "entity": entity], encoding: URLEncoding.default)
    }
}
