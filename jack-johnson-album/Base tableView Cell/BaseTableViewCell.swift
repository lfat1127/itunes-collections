//
//  BaseTableViewCell.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 30/3/2021.
//

import Foundation
import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //Replace a new dispose bag for next time
        disposeBag = DisposeBag()
    }
}
