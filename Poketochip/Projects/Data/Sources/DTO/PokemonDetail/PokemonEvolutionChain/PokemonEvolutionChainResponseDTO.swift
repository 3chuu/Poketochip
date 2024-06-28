//
//  PokemonEvolutionChainResponseDTO.swift
//  Data
//
//  Created by 윤지호 on 6/28/24.
//

import Foundation

/// url - https://pokeapi.co/api/v2/evolution-chain/{id or name}
public struct PokemonEvolutionChainResponseDTO: Decodable {
    public let babyTriggerItem: NameURLResponseDTO?
    public let chain: Chain?
    public let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id, chain
        case babyTriggerItem = "baby_trigger_item"
    }
    
    
    public struct Chain: Decodable {
        let evolutionDetails: [EvolutionDetails]
        let evolvesTo: [Chain]
        let isBaby: Bool
        let species: NameURLResponseDTO
        
        enum CodingKeys: String, CodingKey {
            case species
            case evolutionDetails = "evolution_details"
            case evolvesTo = "evolves_to"
            case isBaby = "is_baby"
        }
    }
    
    public struct EvolutionDetails: Decodable {
        let gender: Int?
        let heldItem: NameURLResponseDTO?
        let item: NameURLResponseDTO?
        let knownMove: NameURLResponseDTO?
        let knownMoveType: NameURLResponseDTO?
        let location: NameURLResponseDTO?
        let minAffection: Int?
        let minBeauty: Int?
        let minHappiness: Int?
        let minLevel: Int?
        let needsOverworldRain: Bool
        let partySpecies: NameURLResponseDTO?
        let partyType: NameURLResponseDTO?
        let relativePhysicalStats: Int?
        let timeOfDay: String?
        let tradeSpecies: NameURLResponseDTO?
        let trigger: NameURLResponseDTO?
        let turnUpsideDown: Bool
        
        enum CodingKeys: String, CodingKey {
            case gender, item, location, trigger
            case heldItem = "held_item"
            case knownMove = "known_move"
            case knownMoveType = "known_move_type"
            case minAffection = "min_affection"
            case minBeauty = "min_beauty"
            case minHappiness = "min_happiness"
            case minLevel = "min_level"
            case needsOverworldRain = "needs_overworld_rain"
            case partySpecies = "party_species"
            case partyType = "party_type"
            case relativePhysicalStats = "relative_physical_stats"
            case timeOfDay = "time_of_day"
            case tradeSpecies = "trade_species"
            case turnUpsideDown = "turn_upside_down"
        }
    }
}
