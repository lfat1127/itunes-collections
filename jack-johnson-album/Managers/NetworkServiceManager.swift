//
//  NetworkService.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift
import Alamofire

class NetworkServiceManager {
    static func searchItunes(with term: String = "jack johnson", entity: String = "album") -> Observable<ItunesSearchResponse<Album>> {
        return NetworkService<ItunesSearchResponse<Album>>()
            .get(url: "https://itunes.apple.com/search",
                 params: ["term": term, "entity": entity], encoding: URLEncoding.default)
    }
}
