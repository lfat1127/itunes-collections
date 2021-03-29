//
//  AlbumListViewController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit

class AlbumListViewController: BaseMVVMViewController<AlbumListViewModel> {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Setup UI
    override func setupUI() {
        super.setupUI()
        setupTableViewUI()
    }
    
    func setupTableViewUI() {
        tableView.register(UINib(nibName: AlbumListCell.reuseId, bundle: nil), forCellReuseIdentifier: AlbumListCell.reuseId)
    }
    
    // MARK: Setup RX
    override func setupRX() {
        super.setupRX()
        setupTableViewWithRx()
    }
    
    func setupTableViewWithRx() {
        viewModel.currentList.bind(to: tableView.rx.items(cellIdentifier: AlbumListCell.reuseId,
                                                          cellType: AlbumListCell.self))
        { cellIndex, album, cell in
            cell.setupCellWithAlbum(album)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbumList().subscribe(onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
