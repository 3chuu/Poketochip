//
//  PokemonAttribute.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct PokemonAttribute: Codable {
    public let classification: PokemonClassification
    public let type: PokemonTypeEnum
    public let height: Double
    public let weight: Double
    public let characteristic: Characteristic
}

public enum PokemonClassification: Codable {
    case 분류
}


public enum Characteristic: Codable {
    case 특성
}
