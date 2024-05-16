//
//  ExampleRepository.swift
//  Data
//
//  Created by 마경미 on 16.05.24.
//

import Foundation

import Infrastructure

import Alamofire
import RxSwift

class ExampleRepository: Networkable {
    typealias Target = ExampleAPI
    
    func getSomething(query: ExampleQuery) -> Single<ExampleResponseDTO> {
        return AF.customRequest(Target.getSomething(query))
    }
    
}
