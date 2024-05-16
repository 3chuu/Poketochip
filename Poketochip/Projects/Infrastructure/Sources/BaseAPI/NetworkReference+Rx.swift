//
//  NetworkReference+Rx.swift
//  Infrastructure
//
//  Created by 마경미 on 16.05.24.
//

import Foundation
import Alamofire
import RxSwift

extension Alamofire.Session {
    public func customRequest<T: Decodable>(_ convertible: URLRequestConvertible) -> Single<T> {
        return Single.create { single in
            let request = self.request(convertible)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            
            return Disposables.create { request.cancel() }
        }
    }
}

extension Reactive where Base: Alamofire.Session {
    public func request<T: Decodable>(_ convertible: URLConvertible,
                                      method: HTTPMethod = .get,
                                      parameters: Parameters? = nil,
                                      encoding: ParameterEncoding = URLEncoding.default,
                                      headers: HTTPHeaders? = nil) -> Single<T> {
        return Single.create { single in
            let request = self.base.request(convertible,
                                            method: method,
                                            parameters: parameters,
                                            encoding: encoding,
                                            headers: headers)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            
            return Disposables.create { request.cancel() }
        }
    }
}
