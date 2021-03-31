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

class CollectionListCell: BaseTableViewCell, CustomCellable {
    @IBOutlet weak var ivCollectionImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    
    var collection: iTunesCollection?
    var isBookMarked: Bool?
    let onBookmarkBtnTapped = PublishSubject<(iTunesCollection, Bool)>()
    
    let bookmarkedImage = UIImage(named: "star-24px")
    let nonBookmarkedImage = UIImage(named: "star_border-24px")
    
    static var reuseId: String {
        return "CollectionListCell"
    }
 
    func setupCellWithCollection(_ collection: iTunesCollection, bookmarked: Bool = false) {
        self.collection = collection
        lblName.text = collection.collectionName
        lblDate.text = "Release Date: " + collection.releaseDate.getDateStr()
        isBookMarked = bookmarked
        btnBookmark.setImage(bookmarked ? bookmarkedImage : nonBookmarkedImage, for: .normal)
        
        ivCollectionImage.af.setImage(withURL: URL(string: collection.artworkUrl60)!, placeholderImage: UIImage(named: "icon_question"))
    }
    
    @IBAction func btnBookmarkTapped(_ sender: Any) {
        if let currentCollection = collection, let bookmarkState = isBookMarked {
            onBookmarkBtnTapped.onNext((currentCollection, bookmarkState))
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collection = nil
    }
}
