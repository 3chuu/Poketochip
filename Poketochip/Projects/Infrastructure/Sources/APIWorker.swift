//
//  APIWorker.swift
//  Infrastructure
//
//  Created by 마경미 on 02.05.24.
//

import Foundation

import Alamofire
import RxSwift

protocol PoketochipRouterInterface {
    func httpHeaders(_ headers: [APIHeader]?) -> HTTPHeaders
}

extension PoketochipRouterInterface {
    public func httpHeaders(_ headers: [APIHeader]?) -> HTTPHeaders {
        var result: [String: String] = [:]
        guard let headers = headers, !headers.isEmpty else { return HTTPHeaders() }
        
        for header in headers {
            result[header.key] = header.value
        }
        
        return HTTPHeaders(result)
    }
}

// MARK: API Worker
public class APIWorker: NSObject, PoketochipRouterInterface {
    
    private func appendCommonHeaders(to headers: [APIHeader]?) -> [APIHeader] {
        var result: [APIHeader] = PoketochipAPI.Header.baseHeaders
        guard let headers = headers else { return result }
        
        result.append(contentsOf: headers)
        
        return result
    }
    
    private func parameters(_ parameters: [APIParameter]?) -> Parameters? {
        guard let kvs = parameters else { return nil }
        var result: [String: Any] = [:]
        
        for kv in kvs {
            result[kv.key] = kv.value
        }
        
        return result.isEmpty ? nil: result
    }
    
    func request(spec: APISpec, headers: [APIHeader]? = nil, parameters: [APIParameter]? = nil, encoding: ParameterEncoding? = URLEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        let params = self.parameters(parameters)
        let hds = self.httpHeaders(self.appendCommonHeaders(to: headers))
        return AF.rx.request(spec.method, spec.url, parameters: params, encoding: encoding!, headers: hds)
            .validate(statusCode: 200..<300)
            .responseData()
            .debug("API Worker has received data from \"\(spec.url)\"")
    }
    
    func request(spec: APISpec, headers: [APIHeader]? = nil, parameters: Encodable, encoding: ParameterEncoding? = URLEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        let params = parameters.asDictionary()
        let hds = self.httpHeaders(self.appendCommonHeaders(to: headers))
        
        return AF.rx.request(spec.method, spec.url, parameters: params, encoding: encoding!, headers: hds)
            .validate(statusCode: 200..<300)
            .responseData()
            .debug("API Worker has received data from \"\(spec.url)\"")
    }
    
    private func request(spec: APISpec, headers: [APIHeader]? = nil, jsonData: Data) -> Observable<(HTTPURLResponse, Data)> {
        let hds = self.httpHeaders(self.appendCommonHeaders(to: headers))
        guard let url = URL(string: spec.url) else {
            return Observable.error(AFError.explicitlyCancelled)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = spec.method.rawValue
        request.httpBody = jsonData
        request.headers = hds
        
        return AF.rx.request(urlRequest: request)
            .validate(statusCode: 200..<300)
            .responseData()
            .debug("API Worker has received data from \"\(spec.url)\"")
    }
    
    func request(spec: APISpec, headers: [APIHeader]? = nil, jsonEncodable: Encodable) -> Observable<(HTTPURLResponse, Data)> {
        guard let jsonData = jsonEncodable.encodeData() else {
            return Observable.error(AFError.explicitlyCancelled)
        }
        
        let hds = self.httpHeaders(self.appendCommonHeaders(to: headers))
        guard let url = URL(string: spec.url) else {
            return Observable.error(AFError.explicitlyCancelled)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = spec.method.rawValue
        request.httpBody = jsonData
        request.headers = hds
        
        return AF.rx.request(urlRequest: request)
            .validate(statusCode: 200..<300)
            .responseData()
            .debug("API Worker has received data from \"\(spec.url)\"")
    }
}
