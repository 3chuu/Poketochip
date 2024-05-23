//
//  NetworkRequestable.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/3/24.
//

import Foundation
import Alamofire

public protocol NetworkEndpoint: URLRequestConvertible {
    /// Request Path
    var path: String { get }
    /// HttpMethod
    var method: HTTPMethod { get }
    /// Parameters
    var parameters: Encodable? { get }
    /// Request Headers
    var headers: HTTPHeaders { get }
  
    func endpoint() throws -> URL
}

public extension NetworkEndpoint {
    func endPoint() throws -> URL {
        guard let endpoint = URL(string: Bundle.baseUrl + path) else {
             throw NetworkError.invalidURL
        }
        return endpoint
    }
  
    func asURLRequest() throws -> URLRequest {
        let url = try Bundle.baseUrl.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)

        // header 설정하기
        //        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch method {
        case .get:
            //파라미터로 들어온 사항 Request 뒤에다가 추가하기
            print(parameters)
        case .post:
            //파라미터 body로 담기
            print(parameters)
        default:
            print(parameters)
            
      }

        return urlRequest
    }
}


