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
    let currentList: BehaviorRelay<[Album]> = BehaviorRelay(value: [])
    var bookmarkedAlbumsResults: Results<Album>? = nil
    var originalAlbums: [Album] = []
    
    func getAlbumList() -> Observable<Bool> {
        return NetworkServiceManager.searchItunes().map({ [weak self] searchResponse in
            self?.originalAlbums = searchResponse.results ?? Array()
            self?.currentList.accept(searchResponse.results ?? Array())
            return true
        })
    }
    
    func bookmarkAlbum(_ album: Album, with bookmarkState: Bool) {
        if bookmarkState {
            if RealmServiceManager.instance.saveAlbum(album) {
                getAllBookmarkedAlbum(true)
            }
        } else {
            if let bookmarkedAlbums = bookmarkedAlbumsResults,
               let albumToDelete = bookmarkedAlbums.first(where: { bookmarkedAlbum in
                bookmarkedAlbum.collectionId == album.collectionId
               }) {
                if RealmServiceManager.instance.removeAlbum(albumToDelete) {
                    getAllBookmarkedAlbum(true)
                }
            }
        }
    }
    
    func isAlbumBookmarked(_ album: Album) -> Bool {
        if let bookmarkedAlbums = bookmarkedAlbumsResults {
            return bookmarkedAlbums.contains { bookmarkedAlbum in
                bookmarkedAlbum.collectionId == album.collectionId && bookmarkedAlbum.bookmarked
            }
        } else {
            return false
        }
    }
    
    func getAllBookmarkedAlbum(_ shouldReload: Bool = false) {
        bookmarkedAlbumsResults = RealmServiceManager.instance.getAllBookmarkedAlbum()
        if shouldReload {
            currentList.accept(originalAlbums)
        }
    }
}
