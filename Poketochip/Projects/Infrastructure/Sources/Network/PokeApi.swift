//
//  PokeAPI.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/3/24.
//

import Foundation
import Alamofire

protocol APIHeader {
    var key: String { get }
    var value: String { get }
}

public enum PokeAPI {
    case ability(id: Int?, name: String?)
    case berry(id: Int?, name: String?)
    case berryFirmness(id: Int?, name: String?)
    case berryFlavor(id: Int?, name: String?)
    case characteristic(id: Int)
    case contestEffect(id: Int)
    case contestType(id: Int?, name: String?)
    case eggGroup(id: Int?, name: String?)
    case encounterCondition(id: Int?, name: String?)
    case encounterConditionValue(id: Int?, name: String?)
    case encounterMethod(id: Int?, name: String?)
    case evolutionChain(id: Int)
    case evolutionTrigger(id: Int?, name: String?)
    case gender(id: Int?, name: String?)
    case generation(id: Int?, name: String?)
    case growthRate(id: Int?, name: String?)
    case item(id: Int?, name: String?)
    case itemAttribute(id: Int?, name: String?)
    case itemCategory(id: Int?, name: String?)
    case itemFlingEffect(id: Int?, name: String?)
    case itemPocket(id: Int?, name: String?)
    case language(id: Int?, name: String?)
    case location(id: Int?, name: String?)
    case locationArea(id: Int?, name: String?)
    case machine(id: Int)
    case move(id: Int?, name: String?)
    case moveAilment(id: Int?, name: String?)
    case moveBattleStyle(id: Int?, name: String?)
    case moveCategory(id: Int?, name: String?)
    case moveDamageClass(id: Int?, name: String?)
    case moveLearnMethod(id: Int?, name: String?)
    case moveTarget(id: Int?, name: String?)
    case nature(id: Int?, name: String?)
    case palParkArea(id: Int?, name: String?)
    case pokeathlonStat(id: Int?, name: String?)
    case pokedex(id: Int?, name: String?)
    case pokemon(id: Int?, name: String?)
    case pokemonColor(id: Int?, name: String?)
    case pokemonForm(id: Int?, name: String?)
    case pokemonHabitat(id: Int?, name: String?)
    case pokemonShape(id: Int?, name: String?)
    case pokemonSpecies(id: Int?, name: String?)
    case region(id: Int?, name: String?)
    case stat(id: Int?, name: String?)
    case superContestEffect(id: Int)
    case type(id: Int?, name: String?)
    case version(id: Int?, name: String?)
    case versionGroup(id: Int?, name: String?)
}

extension PokeAPI {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: Configs.App.baseApiUrl) ?? URL(string: "https://pokeapi.co/api/")!
            //            return URL(string: Configs.App.pokeApiUrl) ?? URL(string: "https://pokeapi.co/api/")!
        }
    }
    // case .stargazers(let fullname, _): return "/repos/\(fullname)/stargazers"
    
    var path: String {
        switch self {
        case .ability(let id, let name):
            return composePath(endpoint: Configs.Endpoint.ability, id: id, name: name)
        case .berry(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.berry, id: id, name: name)
        case .berryFirmness(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.berryFirmness, id: id, name: name)
        case .berryFlavor(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.berryFlavor, id: id, name: name)
        case .contestType(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.contestType, id: id, name: name)
        case .eggGroup(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.eggGroup, id: id, name: name)
        case .encounterCondition(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.encounterCondition, id: id, name: name)
        case .encounterConditionValue(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.encounterConditionValue, id: id, name: name)
        case .encounterMethod(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.encounterMethod, id: id, name: name)
        case .evolutionTrigger(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.evolutionTrigger, id: id, name: name)
        case .gender(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.gender, id: id, name: name)
        case .generation(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.generation, id: id, name: name)
        case .growthRate(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.growthRate, id: id, name: name)
        case .item(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.item, id: id, name: name)
        case .itemAttribute(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.itemAttribute, id: id, name: name)
        case .itemCategory(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.itemCategory, id: id, name: name)
        case .itemFlingEffect(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.itemFlingEffect, id: id, name: name)
        case .itemPocket(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.itemPocket, id: id, name: name)
        case .language(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.language, id: id, name: name)
        case .location(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.location, id: id, name: name)
        case .locationArea(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.locationArea, id: id, name: name)
        case .move(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.move, id: id, name: name)
        case .moveAilment(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveAilment, id: id, name: name)
        case .moveBattleStyle(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveBattleStyle, id: id, name: name)
        case .moveCategory(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveCategory, id: id, name: name)
        case .moveDamageClass(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveDamageClass, id: id, name: name)
        case .moveLearnMethod(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveLearnMethod, id: id, name: name)
        case .moveTarget(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.moveTarget, id: id, name: name)
        case .nature(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.nature, id: id, name: name)
        case .palParkArea(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.palParkArea, id: id, name: name)
        case .pokeathlonStat(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokeathlonStat, id: id, name: name)
        case .pokedex(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokedex, id: id, name: name)
        case .pokemon(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemon, id: id, name: name)
        case .pokemonColor(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemonColor, id: id, name: name)
        case .pokemonForm(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemonForm, id: id, name: name)
        case .pokemonHabitat(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemonHabitat, id: id, name: name)
        case .pokemonShape(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemonShape, id: id, name: name)
        case .pokemonSpecies(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.pokemonSpecies, id: id, name: name)
        case .region(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.region, id: id, name: name)
        case .stat(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.stat, id: id, name: name)
        case .type(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.type, id: id, name: name)
        case .version(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.version, id: id, name: name)
        case .versionGroup(id: let id, name: let name):
            return composePath(endpoint: Configs.Endpoint.versionGroup, id: id, name: name)
        case .characteristic(id: let id):
            return "\(Configs.Endpoint.characteristic)\(id)"
        case .contestEffect(id: let id):
            return "\(Configs.Endpoint.contestEffect)\(id)"
        case .superContestEffect(id: let id):
            return "\(Configs.Endpoint.superContestEffect)\(id)"
        case .evolutionChain(id: let id):
            return "\(Configs.Endpoint.evolutionChain)\(id)"
        case .machine(id: let id):
            return "\(Configs.Endpoint.machine)\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // 경미쓰 헤더 보고 참고함
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    private func composePath(endpoint: Configs.Endpoint, id: Int?, name: String?) -> String {
        if let id = id {
            return "\(endpoint.rawValue)\(id)"
        } else if let name = name {
            return "\(endpoint.rawValue)\(name)"
        }
        fatalError("Invalid endpoint composition")
    }
}
