//
//  RealmManager.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation
import RealmSwift

// MARK: Bookmark, un-bookmark and getting list of bookmarked album
class BookmarkServiceManager {
    public static let instance = BookmarkServiceManager()
    
    func saveAlbum(_ album: iTunesCollection) -> Bool {
        if let realm = try? Realm() {
            do {
                try realm.write {
                    realm.add(album)
                    album.bookmarked = true
                }
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    func removeAlbum(_ album: iTunesCollection) -> Bool  {
        if let realm = try? Realm() {
            do {
                try realm.write {
                    album.bookmarked = false
                }
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    func getAllBookmarkedAlbum() -> Results<iTunesCollection>? {
        if let realm = try? Realm() {
            realm.refresh()
            return realm.objects(iTunesCollection.self)
        }
        return nil
    }
}
