//
//  BaseTabBarController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import UIKit
import RxSwift

// MARK: A MVVM Based UITabBarController
class BaseTabBarController<T: BaseViewModel>: UITabBarController {
    var disposeBag = DisposeBag()
    lazy var viewModel = T()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRX()
    }
    
    func setupUI() {}
    
    func setupRX() {}
}
