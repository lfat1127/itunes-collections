//
//  BaseViewController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift
import UIKit

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
}
