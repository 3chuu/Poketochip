//
//  ExtendPokemon.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct ExtendPokemon: PokemonInterface {
    public let number: Int
    public let name: String
    public let imageName: Int
    public let types: [PokemonTypeEnum]
    public let attribute: [PokemonAttribute]
}
