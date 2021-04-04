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
    
    func saveAlbum(_ album: iTunesCollectionObject) -> Bool {
        if let realm = try? Realm() {
            do {
                try realm.write {
                    realm.add(album)
                }
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    func findAndRemoveAlbum(_ album: iTunesCollection) -> Bool  {
        if let realm = try? Realm() {
            if let savedObject = realm.objects(iTunesCollectionObject.self)
                .first(where: { $0.collectionId == album.collectionId}) {
                return removeAlbumObject(savedObject)
            }
        }
        return false
    }
    
    func removeAlbumObject(_ albumOjbect: iTunesCollectionObject) -> Bool  {
        if let realm = try? Realm() {
            do {
                try realm.write {
                    realm.delete(albumOjbect)
                }
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    func getAllBookmarkedAlbum() -> Results<iTunesCollectionObject>? {
        if let realm = try? Realm() {
            realm.refresh()
            return realm.objects(iTunesCollectionObject.self)
        }
        return nil
    }
}
