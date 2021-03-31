//
//  CustomCellable.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation

// MARK: For UITableViewCell and UICollectionViewCell to define reuse-identifier
protocol CustomCellable {
    static var reuseId: String { get }
}
