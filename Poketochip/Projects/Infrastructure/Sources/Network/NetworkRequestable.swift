//
//  NetworkRequestable.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/3/24.
//

import Foundation
import Alamofire

protocol NetworkRequestable {
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

extension NetworkRequestable {
    func endPoint() throws -> URL {
        guard let endpoint = URL(string: Bundle.baseUrl + path) else {
             throw NetworkError.invalidURL
        }
        return endpoint
    }
}

public enum NetworkError: Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case invalidRequest
    case imageDeserialization
    case decodeError
    case response(AFError)
}

/// Http 통신 코드 (ex, 1xx-5xx)
public typealias HTTPCode = Int
public typealias HTTPCodes = Range<HTTPCode>

public extension HTTPCodes {
    static let success = 200 ..< 300
}


extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "유효하지 않은 URL입니다."
        case let .httpCode(code): return "예상치 못한 HTTP code: \(code)"
        case .unexpectedResponse: return "서버 오류"
        case .imageDeserialization: return "이미지 복호화 실패"
        case .decodeError : return "타입 디코딩 실패"
        case .invalidRequest : return "유효하지 않은 요청입니다."
        case let .response(error) : return "Alamofire 에러: \(error)"
        }
    }
}
