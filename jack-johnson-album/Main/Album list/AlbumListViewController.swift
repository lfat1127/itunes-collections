//
//  AlbumListViewController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit
import RxSwift

class AlbumListViewController: BaseMVVMViewController<AlbumListViewModel> {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Setup UI
    override func setupUI() {
        super.setupUI()
        setupTableViewUI()
    }
    
    func setupTableViewUI() {
        tableView.register(UINib(nibName: CollectionListCell.reuseId, bundle: nil), forCellReuseIdentifier: CollectionListCell.reuseId)
        addRefresher()
    }
    
    func addRefresher() {
        let refresher = UIRefreshControl()
        tableView.refreshControl = refresher
        refresher.rx.controlEvent(.valueChanged).subscribe { [weak self] _ in
            self?.getAlbumList()
        }.disposed(by: disposeBag)
    }
    
    // MARK: Setup RX
    override func setupRX() {
        super.setupRX()
        setupTableViewWithRx()
    }
    
    func setupTableViewWithRx() {
        viewModel.currentList.bind(to: tableView.rx.items(cellIdentifier: CollectionListCell.reuseId,
                                                          cellType: CollectionListCell.self))
        { [weak self] cellIndex, album, cell in
            guard let this = self else { return }
            cell.setupCellWithCollection(album, bookmarked: this.viewModel.isAlbumBookmarked(album))
            cell.onBookmarkBtnTapped.subscribe { [weak self] (album, bookmarkState) in
                self?.viewModel.bookmarkAlbum(album, with: !bookmarkState)
            }.disposed(by: cell.disposeBag)

        }.disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(iTunesCollection.self))
            .subscribe { [weak self] indexPath, album in
                // TODO: may be show a detail view?
                self?.tableView.deselectRow(at: indexPath, animated: true)
            }.disposed(by: disposeBag)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbumList().subscribe(onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getAllBookmarkedAlbum(true)
    }
    
    func getAlbumList() {
        viewModel.getAlbumList().subscribe(onNext: { [weak self] _ in
            self?.tableView.refreshControl?.endRefreshing()
        }, onError: { [weak self] error in
            //MARK: should use error message, but here force it to please try again
            self?.showErrorAlert(with: "Error on loading list, please try again")
        }).disposed(by: disposeBag)
    }
}
