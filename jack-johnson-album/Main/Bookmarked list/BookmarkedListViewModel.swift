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
    let bookmarkedAlbumsResults = BehaviorRelay<[iTunesCollection]>(value: [])
    
    func getAllBookmarkedAlbum() {
        
        if let array: [iTunesCollection] = BookmarkServiceManager.instance.getAllBookmarkedAlbum()?.filter("bookmarked == true").compactMap({ $0 }) {
            bookmarkedAlbumsResults.accept(array)
        }
    }
    
    func removeBookmark(_ albumToRemove: iTunesCollection) {
        if BookmarkServiceManager.instance.removeAlbum(albumToRemove) {
            getAllBookmarkedAlbum()
        }
    }
}
