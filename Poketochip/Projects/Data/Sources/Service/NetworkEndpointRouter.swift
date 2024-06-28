//
//  NetworkEndpointRouter.swift
//  Data
//
//  Created by cha_nyeong on 5/20/24.
//

import Foundation

import Alamofire
import RxSwift

import Infrastructure

public enum NetworkEndpointRouter {
    case get(requestDTO: Encodable)
    case post(requestDTO: Encodable)
    case getPokemonDetail(requestDTO: PokemonDetailRequestDTO)
}

extension NetworkEndpointRouter: NetworkEndpoint {
    public var path: String {
        switch self {
        //여기를 어떻게 해야할지 모르겠다 @-@
        //뭔가 Encodable 하는곳에서 path를 넘겨야 하나 혹은 뭔가 다른 값을 받아서 처리를 해야하나
        //내부 프로토콜 하나 더 두고 dto.path로 넘기게 해야하나 고민중..
        case .get(let dto):
            return ""
        case .post(let dto):
            return ""
        case .getPokemonDetail(let dto):
            return "/\(dto.idOrName)"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .get, .getPokemonDetail:
            return .get
        case .post:
            return .post
        }
    }
    
    public var parameters: Encodable? {
        switch self {
        case .get(let dto):
            return dto
        case .post(let dto):
            return dto
        default:
            return nil
        }
    }
    
    public var headers: Alamofire.HTTPHeaders {
        return .default
    }
    
    public func endpoint() throws -> URL {
        guard let endpoint = URL(string: Bundle.baseUrl + path) else {
             throw NetworkError.invalidURL
        }
        return endpoint
    }
}

