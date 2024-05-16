//
//  TargetType.swift
//  Infrastructure
//
//  Created by 마경미 on 16.05.24.
//

import Foundation

import Alamofire

public protocol Networkable {
    associatedtype Target: NetworkEndPoint
}

public protocol NetworkEndPoint: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var task: RequestTask { get }
    var headers: HTTPHeaders { get }
}

extension NetworkEndPoint {
    public var baseURL: URL {
        guard let apiURL = URL(string: "https://pokeapi.co/api/") else { fatalError("URL is invalid")}
        return apiURL
    }
    
    public var headers: HTTPHeaders {
        return .default
    }
}

extension NetworkEndPoint {
    
    // URLRequestConvertible 구현
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        
        // header 설정하기
        //        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch task {
        case .requestPlain:
            break
        case .requestJSONEncodable(let body):
            do {
                urlRequest.httpBody = try JSONEncoder().encode(AnyEncodable(body))
            } catch {
                throw NetworkError.encodingError(error)
            }
        case .requestParameters(let params):
            let params = params.toDictionary()
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .requestCompositeData(let body, let params):
            do {
                urlRequest.httpBody = try JSONEncoder().encode(AnyEncodable(body))
                let params = params.toDictionary()
                let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
            } catch {
                throw NetworkError.encodingError(error)
            }
        }
        
        return urlRequest
    }
}

public enum RequestTask {
    case requestPlain
    case requestJSONEncodable(_ bodyData: Encodable)
    case requestParameters(_ parameters: Encodable)
    case requestCompositeData(_ bodyData: Encodable, _ parameters: Encodable)
}
