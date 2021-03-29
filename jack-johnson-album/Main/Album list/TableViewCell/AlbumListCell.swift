//
//  AlbumListCell.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit

class AlbumListCell: UITableViewCell, CustomCellable {
    @IBOutlet weak var lblName: UILabel!
    static var reuseId: String {
        return "AlbumListCell"
    }
 
    func setupCellWithAlbum(_ album: Album) {
        lblName.text = album.collectionName
    }
}
