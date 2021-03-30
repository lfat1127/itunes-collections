//
//  RealmManager.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation
import RealmSwift

class RealmServiceManager {
    public static let instance = RealmServiceManager()
    
    func saveAlbum(_ album: Album) -> Bool {
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
    
    func removeAlbum(_ album: Album) -> Bool  {
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
    
    func getAllBookmarkedAlbum() -> Results<Album>? {
        if let realm = try? Realm() {
            realm.refresh()
            return realm.objects(Album.self)
        }
        return nil
    }
}
