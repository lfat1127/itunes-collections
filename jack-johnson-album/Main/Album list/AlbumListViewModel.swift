//
//  AlbumListViewModel.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class AlbumListViewModel: BaseViewModel {
    let currentList: BehaviorRelay<[iTunesCollection]> = BehaviorRelay(value: [])
    var bookmarkedAlbumsResults: Results<iTunesCollectionObject>? = nil
    var originalAlbums: [iTunesCollection] = []
    
    func getAlbumList() -> Observable<Bool> {
        return NetworkServiceManager.searchItunes().map({ [weak self] searchResponse in
            self?.originalAlbums = searchResponse.results
            self?.currentList.accept(searchResponse.results)
            return true
        })
    }
    
    func bookmarkAlbum(_ album: iTunesCollection, with bookmarkState: Bool) {
        if bookmarkState {
            if BookmarkServiceManager.instance.saveAlbum(iTunesCollectionObject.convertFromITunesCollection(collection: album)) {
                getAllBookmarkedAlbum(true)
            }
        } else {
            if BookmarkServiceManager.instance.findAndRemoveAlbum(album) {
                getAllBookmarkedAlbum(true)
            }
        }
    }
    
    func isAlbumBookmarked(_ album: iTunesCollection) -> Bool {
        if let bookmarkedAlbums = bookmarkedAlbumsResults {
            return bookmarkedAlbums.contains { bookmarkedAlbum in
                bookmarkedAlbum.collectionId == album.collectionId
            }
        } else {
            return false
        }
    }
    
    func getAllBookmarkedAlbum(_ shouldReload: Bool = false) {
        bookmarkedAlbumsResults = BookmarkServiceManager.instance.getAllBookmarkedAlbum()
        if shouldReload {
            currentList.accept(originalAlbums)
        }
    }
}
