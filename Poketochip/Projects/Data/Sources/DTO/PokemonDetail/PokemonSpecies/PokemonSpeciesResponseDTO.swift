//
//  PokemonSpeciesResponseDTO.swift
//  Data
//
//  Created by 윤지호 on 6/28/24.
//

import Foundation

struct PokemonSpeciesResponseDTO: Decodable {
    let baseHappiness, captureRate: Int
    let color: NameURLResponseDTO
    let eggGroups: [NameURLResponseDTO]
    let evolutionChain: URLResponseDTO
    let evolvesFromSpecies: NameURLResponseDTO
    let flavorTextEntries: [FlavorTextEntry]
    let formDescriptions: [Description]
    let formsSwitchable: Bool
    let genderRate: Int
    let genera: [Genus]
    let generation, growthRate, habitat: NameURLResponseDTO
    let hasGenderDifferences: Bool
    let hatchCounter, id: Int
    let isBaby, isLegendary, isMythical: Bool
    let name: String
    let names: [Name]
    let order: Int
    let palParkEncounters: [PalParkEncounter]
    let pokedexNumbers: [PokedexNumber]
    let shape: NameURLResponseDTO
    let varieties: [Variety]

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }
    
    // MARK: - Description
    struct Description: Decodable {
        let description: String
        let language: NameURLResponseDTO
    }

    // MARK: - FlavorTextEntry
    struct FlavorTextEntry: Decodable {
        let flavorText: String
        let language, version: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language, version
        }
    }

    // MARK: - Genus
    struct Genus: Decodable {
        let genus: String
        let language: NameURLResponseDTO
    }

    // MARK: - Name
    struct Name: Decodable {
        let language: NameURLResponseDTO
        let name: String
    }

    // MARK: - PalParkEncounter
    struct PalParkEncounter: Decodable {
        let area: NameURLResponseDTO
        let baseScore, rate: Int

        enum CodingKeys: String, CodingKey {
            case area
            case baseScore = "base_score"
            case rate
        }
    }

    // MARK: - PokedexNumber
    struct PokedexNumber: Decodable {
        let entryNumber: Int
        let pokedex: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case entryNumber = "entry_number"
            case pokedex
        }
    }

    // MARK: - Variety
    struct Variety: Decodable {
        let isDefault: Bool
        let pokemon: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case isDefault = "is_default"
            case pokemon
        }
    }
}

