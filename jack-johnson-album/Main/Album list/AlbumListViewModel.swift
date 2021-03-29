//
//  AlbumListViewModel.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift
import RxCocoa

class AlbumListViewModel: BaseViewModel {
    var currentList: BehaviorRelay<[Album]> = BehaviorRelay(value: [])
    
    func getAlbumList() -> Observable<Bool> {
        return NetworkServiceManager.getAlbumList().map({ [weak self] searchResponse in
                self?.currentList.accept(searchResponse.results ?? Array())
                return true
        })
    }
}
