//
//  NetworkError.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/20/24.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case invalidRequest
    case imageDeserialization
    case encodeError
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
        case let .httpCode(code): return "예상치 못한 HTTP code: \(code) 입니다."
        case .unexpectedResponse: return "서버 오류입니다."
        case .imageDeserialization: return "이미지 복호화 에 실패하였습니다."
        case .encodeError : return "타입 인코딩에 실패하였습니다."
        case .decodeError : return "타입 디코딩에 실패하였습니다."
        case .invalidRequest : return "유효하지 않은 요청입니다."
        case let .response(error) : return "Alamofire 에러입니다. 사유 : \(error)"
        }
    }
}
