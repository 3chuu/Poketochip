//
//  API.swift
//  Infrastructure
//
//  Created by 마경미 on 02.05.24.
//

import Foundation

// MARK: APIs of AFP
typealias PoketochipHeader = PoketochipAPI.Header
typealias PoketochipResponse = PoketochipAPI.Response
typealias PoketochipNoResponse = PoketochipAPI.NoResponse
typealias PoketochipCodableResponse = PoketochipAPI.CodableResponse


enum PoketochipAPI {
    private static let _config: PoketochipAPIConfigType = PoketochipAPIConfig()
    static let hostApi: String = _config.hostApi
    
    // MARK: Common Headers
    enum Header: APIHeader {
        case contentJson
        
        var key: String {
            switch self {
            case .contentJson: return "Content-Type"
            }
        }
        
        var value: String {
            switch self {
            case .contentJson: return "application/json"
            }
        }
        
        static var baseHeaders: [Self] {
            return [.contentJson]
        }
    }
    
    struct Response: Codable {
        let status: String?
        let code: Int?
        let errorCode: String?
        var result: APIResult {
            return self.code == APIRes.ok ? .success : .failed
        }
    }
    
    struct NoResponse: Codable {
    }
    
    struct CodableResponse<T: Codable>: Codable {
        var result: T?
    }
}
