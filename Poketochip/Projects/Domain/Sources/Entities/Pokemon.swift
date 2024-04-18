//
//  Pokemon.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct Pokemon: PokemonInterface, Codable {
    public var number: Int
    public var name: String
    public var imageName: Int
    public let types: [PokemonTypeEnum]
}

protocol PokemonInterface: Codable {
    var number: Int { get }
    var name: String { get }
    var imageName: Int { get }
}
