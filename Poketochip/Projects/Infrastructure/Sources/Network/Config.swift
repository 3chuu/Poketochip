//
//  Config.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/3/24.
//

import Foundation

enum Configs {
    enum App {
        static let baseApiUrl = "https://pokeapi.co/api/v2"
        static let pokeApiUrl = "https://pokeapi.co/api/v2"
    }

    enum Endpoint: String {
        case ability = "ability/"
        case berry = "berry/"
        case berryFirmness = "berry-firmness/"
        case berryFlavor = "berry-flavor/"
        case characteristic = "characteristic/"
        case contestEffect = "contest-effect/"
        case contestType = "contest-type/"
        case eggGroup = "egg-group/"
        case encounterCondition = "encounter-condition/"
        case encounterConditionValue = "encounter-condition-value/"
        case encounterMethod = "encounter-method/"
        case evolutionChain = "evolution-chain/"
        case evolutionTrigger = "evolution-trigger/"
        case gender = "gender/"
        case generation = "generation/"
        case growthRate = "growth-rate/"
        case item = "item/"
        case itemAttribute = "item-attribute/"
        case itemCategory = "item-category/"
        case itemFlingEffect = "item-fling-effect/"
        case itemPocket = "item-pocket/"
        case language = "language/"
        case location = "location/"
        case locationArea = "location-area/"
        case machine = "machine/"
        case move = "move/"
        case moveAilment = "move-ailment/"
        case moveBattleStyle = "move-battle-style/"
        case moveCategory = "move-category/"
        case moveDamageClass = "move-damage-class/"
        case moveLearnMethod = "move-learn-method/"
        case moveTarget = "move-target/"
        case nature = "nature/"
        case palParkArea = "pal-park-area/"
        case pokeathlonStat = "pokeathlon-stat/"
        case pokedex = "pokedex/"
        case pokemon = "pokemon/"
        case pokemonColor = "pokemon-color/"
        case pokemonForm = "pokemon-form/"
        case pokemonHabitat = "pokemon-habitat/"
        case pokemonShape = "pokemon-shape/"
        case pokemonSpecies = "pokemon-species/"
        case region = "region/"
        case stat = "stat/"
        case superContestEffect = "super-contest-effect/"
        case type = "type/"
        case version = "version/"
        case versionGroup = "version-group/"
    }
}
