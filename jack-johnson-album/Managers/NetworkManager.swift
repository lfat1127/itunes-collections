//
//  NetworkManager.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import Alamofire
import RxSwift

class NetworkManager {
    public static let instance = NetworkManager()
    public let manager = Alamofire.Session.default
    
    private init() {
        manager.session.configuration.timeoutIntervalForRequest = 5
    }
}
