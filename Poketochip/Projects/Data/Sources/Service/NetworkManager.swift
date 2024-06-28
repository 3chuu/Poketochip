//
//  NetworkService.swift
//  Data
//
//  Created by cha_nyeong on 5/20/24.
//

import Foundation

import Infrastructure

import Alamofire
import RxSwift

public protocol NetworkProtocol {
    func request<T: Decodable>(_ model: NetworkEndpoint, reponseType: T.Type) -> Single<T>
}

public final class NetworkManager: NetworkProtocol {
    public static let shared = NetworkManager()
    
    private init() { }
        
    public func request<T: Decodable>(_ model: NetworkEndpoint, reponseType: T.Type) -> Single<T> {
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
                        
                        guard let data = data else {
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
                        
                        do {
                            let decodedData = try JSONDecoder().decode(reponseType.self, from: data)
                            single(.success(decodedData))
                            
                            print("""
                            --------------------    success  ----------------------
                            url: \(endpoint)
                            header: \(model.headers)
                            param: \(parameters)
                            success: \(response)
                            --------------------------------------------------------
                            """)
                            
                        } catch let DecodingError.dataCorrupted(context) {
                            print(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context)  {
                            print("Type '\(type)' mismatch:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch {
                            print("error: ", error)
                        } catch {
                            
                            print("--------------------------------------------------------")
                            
                            print(error)
                            single(.failure(NetworkError.decodeError))
                        }
                                                
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
                        
                        single(.failure(NetworkError.response(error)))
                    }
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
