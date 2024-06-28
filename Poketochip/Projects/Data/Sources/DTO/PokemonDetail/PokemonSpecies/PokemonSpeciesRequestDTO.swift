//
//  PokemonSpeciesRequestDTO.swift
//  Data
//
//  Created by 윤지호 on 6/28/24.
//

import Foundation

public struct PokemonDetailRequestDTO {
    public let idOrName: String
    
    public init(idOrName: String) {
        self.idOrName = idOrName
    }
}
