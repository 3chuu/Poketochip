//
//  PokemonType.swift
//  Common
//
//  Created by cha_nyeong on 1/21/24.
//

import Foundation
import UIKit

public enum PokemonTypeEnum: String, Codable {
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
    public let no: Int
    public let name: PokemonTypeEnum
    public let symbolImage: UIImage
    public let iconImage: UIImage
    
    public static let normal = PokemonType(no: 1, name: .normal, symbolImage: CommonAsset.normal.image, iconImage: CommonAsset.normalIcon.image)
    public static let fighting = PokemonType(no: 2, name: .fighting, symbolImage: CommonAsset.fighting.image, iconImage: CommonAsset.fightingIcon.image)
    public static let flying = PokemonType(no: 3, name: .flying, symbolImage: CommonAsset.flying.image, iconImage: CommonAsset.flyingIcon.image)
    public static let poison = PokemonType(no: 4, name: .poison, symbolImage: CommonAsset.poison.image, iconImage: CommonAsset.poisonIcon.image)
    public static let ground = PokemonType(no: 5, name: .ground, symbolImage: CommonAsset.ground.image, iconImage: CommonAsset.groundIcon.image)
    public static let rock = PokemonType(no: 6, name: .rock, symbolImage: CommonAsset.rock.image, iconImage: CommonAsset.rockIcon.image)
    public static let bug = PokemonType(no: 7, name: .bug, symbolImage: CommonAsset.bug.image, iconImage: CommonAsset.bugIcon.image)
    public static let ghost = PokemonType(no: 8, name: .ghost, symbolImage: CommonAsset.ghost.image, iconImage: CommonAsset.ghostIcon.image)
    public static let steel = PokemonType(no: 9, name: .steel, symbolImage: CommonAsset.steel.image, iconImage: CommonAsset.steelIcon.image)
    public static let fire = PokemonType(no: 10, name: .fire, symbolImage: CommonAsset.fire.image, iconImage: CommonAsset.fireIcon.image)
    public static let water = PokemonType(no: 11, name: .water, symbolImage: CommonAsset.water.image, iconImage: CommonAsset.waterIcon.image)
    public static let grass = PokemonType(no: 12, name: .grass, symbolImage: CommonAsset.grass.image, iconImage: CommonAsset.grassIcon.image)
    public static let electric = PokemonType(no: 13, name: .electric, symbolImage: CommonAsset.electric.image, iconImage: CommonAsset.electricIcon.image)
    public static let psychic = PokemonType(no: 14, name: .psychic, symbolImage: CommonAsset.psychic.image, iconImage: CommonAsset.psychicIcon.image)
    public static let ice = PokemonType(no: 15, name: .ice, symbolImage: CommonAsset.ice.image, iconImage: CommonAsset.iceIcon.image)
    public static let dragon = PokemonType(no: 16, name: .dragon, symbolImage: CommonAsset.dragon.image, iconImage: CommonAsset.dragonIcon.image)
    public static let dark = PokemonType(no: 17, name: .dark, symbolImage: CommonAsset.dark.image, iconImage: CommonAsset.darkIcon.image)
    public static let fairy = PokemonType(no: 18, name: .fairy, symbolImage: CommonAsset.fairy.image, iconImage: CommonAsset.fairyIcon.image)
    public static let unknown = PokemonType(no: 10001, name: .unknown, symbolImage: CommonAsset.normal.image, iconImage: CommonAsset.normalIcon.image)
    public static let shadow = PokemonType(no: 10002, name: .shadow, symbolImage: CommonAsset.normal.image, iconImage: CommonAsset.normalIcon.image)
}





