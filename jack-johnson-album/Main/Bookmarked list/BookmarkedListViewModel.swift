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
    let bookmarkedAlbumsResults = BehaviorRelay<[Album]>(value: [])
    
    func getAllBookmarkedAlbum() {
        
        if let array: [Album] = RealmServiceManager.instance.getAllBookmarkedAlbum()?.filter("bookmarked == true").compactMap({ $0 }) {
            bookmarkedAlbumsResults.accept(array)
        }
    }
    
    func removeBookmark(_ albumToRemove: Album) {
        if RealmServiceManager.instance.removeAlbum(albumToRemove) {
            getAllBookmarkedAlbum()
        }
    }
}
