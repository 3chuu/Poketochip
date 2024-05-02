//
//  PokemonDetail.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct PokemonDetail {
    public let description: String
    public let attribute: PokemonAttribute
    public let moreInfoUrl: String
    public let obtainRule: String
    public let evolution: [Pokemon]
    public let stat: [PokemonStat]
}
