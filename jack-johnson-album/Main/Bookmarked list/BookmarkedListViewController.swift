//
//  BookmarkedListViewController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit
import RxSwift

class BookmarkedListViewController: BaseMVVMViewController<BookmarkedListViewModel> {
    @IBOutlet weak var tableView: UITableView!
    override func setupUI() {
        super.setupUI()
        setupTableViewUI()
    }
    
    // MARK: Setup TableView UI
    func setupTableViewUI() {
        tableView.register(UINib(nibName: CollectionListCell.reuseId, bundle: nil), forCellReuseIdentifier: CollectionListCell.reuseId)
    }
    
    // MARK: Setup RX
    override func setupRX() {
        super.setupRX()
        setupTableViewWithRx()
    }
    
    // MARK: Setup TableView RX
    func setupTableViewWithRx() {
        viewModel.bookmarkedAlbumsResults.bind(to: tableView.rx.items(cellIdentifier: CollectionListCell.reuseId,
                                                          cellType: CollectionListCell.self))
        { [weak self] cellIndex, album, cell in
            cell.setupCellWithCollection(album, bookmarked: true)
            cell.onBookmarkBtnTapped.subscribe { [weak self] (album, bookmarkState) in
                self?.viewModel.removeBookmark(album)
            }.disposed(by: cell.disposeBag)

        }.disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(iTunesCollection.self))
            .subscribe { [weak self] indexPath, album in
                // TODO: may be show a detail view?
                self?.tableView.deselectRow(at: indexPath, animated: true)
            }.disposed(by: disposeBag)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Get bookmark list
        viewModel.getAllBookmarkedAlbum()
    }
}
