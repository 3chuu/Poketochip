//
//  File.swift
//  Data
//
//  Created by 마경미 on 16.05.24.
//

import RxSwift

import Infrastructure

import Alamofire

enum ExampleAPI {
    case getSomething(ExampleQuery)
    case postSomething(ExampleRequestDTO)
}

extension ExampleAPI: NetworkEndPoint {
    var path: String {
        switch self {
            
        case .getSomething(let query):
            return "/example/\(query.something)"
        case .postSomething:
            return "/example"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .postSomething:
            return .post
        default:
            return .get
        }
    }
    
    var task: RequestTask {
        switch self {
        case .getSomething(let query):
            return .requestPlain
        case .postSomething(let body):
            return .requestJSONEncodable(body)
        }
    }
}
