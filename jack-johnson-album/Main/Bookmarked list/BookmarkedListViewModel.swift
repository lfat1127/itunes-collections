//
//  BookmarkedListViewModel.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation
import RealmSwift
import RxCocoa

class BookmarkedListViewModel: BaseViewModel {
    let bookmarkedAlbumsResults = BehaviorRelay<[iTunesCollectionObject]>(value: [])
    
    func getAllBookmarkedAlbum() {
        
        if let array: [iTunesCollectionObject] = BookmarkServiceManager.instance.getAllBookmarkedAlbum()?.compactMap({ $0 }) {
            bookmarkedAlbumsResults.accept(array)
        }
    }
    
    func removeBookmark(_ albumToRemove: iTunesCollectionObject) {
        if BookmarkServiceManager.instance.removeAlbumObject(albumToRemove) {
            getAllBookmarkedAlbum()
        }
    }
}
