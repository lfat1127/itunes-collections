//
//  AlbumListCell.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit
import RxSwift
import AlamofireImage

class AlbumListCell: BaseTableViewCell, CustomCellable {
    @IBOutlet weak var ivAlbum: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    
    var album: Album?
    var isBookMarked: Bool?
    let onBookmarkBtnTapped = PublishSubject<(Album, Bool)>()
    
    let bookmarkedImage = UIImage(named: "star-24px")
    let nonBookmarkedImage = UIImage(named: "star_border-24px")
    
    static var reuseId: String {
        return "AlbumListCell"
    }
 
    func setupCellWithAlbum(_ album: Album, bookmarked: Bool = false) {
        self.album = album
        lblName.text = album.collectionName
        lblDate.text = "Release Date: " + album.releaseDate.getDateStr()
        isBookMarked = bookmarked
        btnBookmark.setImage(bookmarked ? bookmarkedImage : nonBookmarkedImage, for: .normal)
        
        ivAlbum.af.setImage(withURL: URL(string: album.artworkUrl60)!, placeholderImage: UIImage(named: "icon_question"))
    }
    
    @IBAction func btnBookmarkTapped(_ sender: Any) {
        if let currentAlbum = album, let bookmarkState = isBookMarked {
            onBookmarkBtnTapped.onNext((currentAlbum, bookmarkState))
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        album = nil
    }
}
