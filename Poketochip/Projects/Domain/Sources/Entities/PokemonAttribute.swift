//
//  PokemonAttribute.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct PokemonAttribute {
    public let classification: PokemonClassification
    public let type: PokemonTypeEnum
    public let height: Double
    public let weight: Double
    public let characteristic: Characteristic
}

public enum PokemonClassification {
    case 분류
}


public enum Characteristic {
    case 특성
}
