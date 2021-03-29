//
//  NetworkService.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift

class NetworkServiceManager {
    static func getAlbumList() -> Observable<ItunesSearchResponse<Album>> {
        return NetworkService<ItunesSearchResponse<Album>>().get(url: "https://itunes.apple.com/search?term=jack+johnson&entity=album")
    }
}
