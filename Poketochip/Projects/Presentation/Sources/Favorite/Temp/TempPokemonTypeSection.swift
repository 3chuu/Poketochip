//
//  TempPokemonTypeSection.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import Foundation

// type => Type enum으로 교체하기
struct PokemonTypeCell {
    let type: String
}

extension PokemonTypeCell {
    static var types: [PokemonTypeCell] {
        return [
            .init(type: "번개"),
            .init(type: "물"),
            .init(type: "불"),
            .init(type: "돌"),
            .init(type: "풀")
        ]
    }
}
