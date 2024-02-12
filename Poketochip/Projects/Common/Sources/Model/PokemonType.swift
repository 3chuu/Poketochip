//
//  PokemonType.swift
//  Common
//
//  Created by cha_nyeong on 1/21/24.
//

import Foundation

public enum PokemonTypeEnum: String {
    case normal = "노말"
    case fighting = "격투"
    case flying = "비행"
    case poison = "독"
    case ground = "땅"
    case rock = "바위"
    case bug = "벌레"
    case ghost = "고스트"
    case steel = "강철"
    case fire = "불꽃"
    case water = "물"
    case grass = "풀"
    case electric = "전기"
    case psychic = "에스퍼"
    case ice = "얼음"
    case dragon = "드래곤"
    case dark = "악"
    case fairy = "페어리"
    case unknown = "모름"
    case shadow = "그림자"
}

public struct PokemonType {
    let no: Int
    let name: PokemonTypeEnum
    let symbolName: String?
    let iconName: String?
    
    static let normal = PokemonType(no: 1, name: .normal, symbolName: "Normal", iconName: "Normal_Icon")
    static let fighting = PokemonType(no: 2, name: .fighting, symbolName: "Fighting", iconName: "Fighting_Icon")
    static let flying = PokemonType(no: 3, name: .flying, symbolName: "Flying", iconName: "Flying_Icon")
    static let poison = PokemonType(no: 4, name: .poison, symbolName: "Poison", iconName: "Poison_Icon")
    static let ground = PokemonType(no: 5, name: .ground, symbolName: "Ground", iconName: "Ground_Icon")
    static let rock = PokemonType(no: 6, name: .rock, symbolName: "Rock", iconName: "Rock_Icon")
    static let bug = PokemonType(no: 7, name: .bug, symbolName: "Bug", iconName: "Bug_Icon")
    static let ghost = PokemonType(no: 8, name: .ghost, symbolName: "Ghost", iconName: "Ghost_Icon")
    static let steel = PokemonType(no: 9, name: .steel, symbolName: "Steel", iconName: "Steel_Icon")
    static let fire = PokemonType(no: 10, name: .fire, symbolName: "Fire", iconName: "Fire_Icon")
    static let water = PokemonType(no: 11, name: .water, symbolName: "Water", iconName: "Water_Icon")
    static let grass = PokemonType(no: 12, name: .grass, symbolName: "Grass", iconName: "Grass_Icon")
    static let electric = PokemonType(no: 13, name: .electric, symbolName: "Electric", iconName: "Electric_Icon")
    static let psychic = PokemonType(no: 14, name: .psychic, symbolName: "Psychic", iconName: "Psychic_Icon")
    static let ice = PokemonType(no: 15, name: .ice, symbolName: "Ice", iconName: "Ice_Icon")
    static let dragon = PokemonType(no: 16, name: .dragon, symbolName: "Dragon", iconName: "Dragon_Icon")
    static let dark = PokemonType(no: 17, name: .dark, symbolName: "Dark", iconName: "Dark_Icon")
    static let fairy = PokemonType(no: 18, name: .fairy, symbolName: "Fairy", iconName: "Fairy_Icon")
    static let unknown = PokemonType(no: 10001, name: .unknown, symbolName: "Normal", iconName: "Normal_Icon")
    static let shadow = PokemonType(no: 10002, name: .shadow, symbolName: "Normal", iconName: "Normal_Icon")
}





