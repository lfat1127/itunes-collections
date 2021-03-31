//
//  BaseMVVMViewController.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import RxSwift

// MARK: A MVVM Based ViewController
class BaseMVVMViewController<T: BaseViewModel>: BaseViewController {
    lazy var viewModel = T()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRX()
    }
    
    func setupUI() {}
    
    func setupRX() {}
}
