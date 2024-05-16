//
//  NetworkManager.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/14/24.
//

import Foundation

import Alamofire
import RxSwift

protocol NetworkProtocol {
    func request(_ model: NetworkRequestable) -> Single<NetworkManager.Response>
}

final class NetworkManager: NetworkProtocol {
    typealias Response = Result<Data, NetworkError>
    
    public func request(_ model: NetworkRequestable) -> Single<Response> {
        .create { [weak self] single in
            do {
                let endpoint = try model.endpoint()
                
                let parameters = model.parameters?.requestable ?? [:]
                
                AF.request(
                    endpoint,
                    method: model.method,
                    parameters: parameters,
                    headers: model.headers
                ).response { [single] response in
                    switch response.result {
                    case .success(let data):
                        print("""
                        --------------------    success  ----------------------
                        url: \(endpoint)
                        header: \(model.headers)
                        param: \(parameters)
                        success: \(response)
                        --------------------------------------------------------
                        """)
                    case .failure(let error):
                        print("""
                        ----------------------   error  ------------------------
                        url: \(endpoint)
                        method: \(model.method)
                        total header: \(model.headers)
                        error: \(error)
                        response: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")
                        --------------------------------------------------------
                        """)
                    }
                    
                    if let error = response.error {
                        single(.failure(NetworkError.response(error)))
                    }
                    guard let data = response.data else {
                        single(.failure(NetworkError.unexpectedResponse))
                        return
                    }
                    print("""
                    --------------------    success  ----------------------
                    url: \(endpoint)
                    header: \(model.headers)
                    param: \(parameters)
                    success: \(response)
                    --------------------------------------------------------
                    """)
                    single(.success(.success(data)))
                }
                return Disposables.create()
            } catch {
                self?.requestErrorHandling(error)
                single(.failure(NetworkError.invalidRequest))
                return Disposables.create()
            }
        }
    }
}

extension NetworkManager {
    private func requestErrorHandling(_ error: Error) {
        guard let error = error as? NetworkError else {
            debugPrint("** Unhandled error occurs \(error.localizedDescription)")
            return
        }
        
        switch error {
        case .invalidURL:
            debugPrint("** invalidURL occurs")
        case .invalidRequest:
            debugPrint("** invalidRequest occurs")
        default:
            debugPrint("** \(error.errorDescription!) occurs")
        }
    }
    
    private func debugError() {
        
    }
}
