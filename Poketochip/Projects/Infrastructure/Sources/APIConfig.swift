//
//  APIConfig.swift
//  Infrastructure
//
//  Created by 마경미 on 02.05.24.
//

import Foundation

protocol PoketochipAPIConfigType {
    var hostApi: String { get }
}

struct PoketochipAPIConfig: PoketochipAPIConfigType {
    var hostApi: String = "https://pokeapi.co/api/v2/"
}
