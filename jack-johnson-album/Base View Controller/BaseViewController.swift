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
    
    func showErrorAlert(with message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "confirm", style: .cancel)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}
