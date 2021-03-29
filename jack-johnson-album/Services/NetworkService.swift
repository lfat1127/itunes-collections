//
//  NetworkService.swift
//  jack-johnson-album
//
//  Created by Ray Chow on 29/3/2021.
//

import Foundation
import ObjectMapper
import Alamofire
import RxSwift

class NetworkService<T: Mappable> {
    func get(url:String, params:[String:Any]? = nil, requireHeader: Bool = true, encoding: ParameterEncoding = JSONEncoding.default) -> Observable<T> {
        return request(url: url, params: params, method: .get, encoding: encoding, requireHeader: requireHeader)
    }
    
    private func request(url:String, params:[String:Any]? = nil, method: HTTPMethod = .get, encoding: ParameterEncoding, requireHeader: Bool = true) -> Observable<T> {
        let request = NetworkManager.instance.manager.request(url, method: method, parameters: params, encoding: encoding, headers: nil)
        
        return Observable<T>.create{ observer in
            request.responseJSON { response in
                switch response.result {
                case .success(let value):
                    let result = Mapper<T>().map(JSONObject: value)
                    if let returnValue = result {
                        observer.onNext(returnValue)
                        observer.onCompleted()
                    } else {
                        observer.onError(NSError(domain: "NetworkService", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON parse error"]))
                    }
                    break
                case .failure(let error):
                    observer.onError(error)
                    break
                }
            }
            return Disposables.create{
                request.cancel()
            }
        }
    }
}
