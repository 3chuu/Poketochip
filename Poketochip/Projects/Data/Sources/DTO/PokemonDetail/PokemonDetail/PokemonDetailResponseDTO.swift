//
//  PokemonDetailResponseDTO.swift
//  Data
//
//  Created by 윤지호 on 6/28/24.
//

import Foundation

// MARK: - PokemonDetailResponseDTO
struct PokemonDetailResponseDTO: Decodable {
    let id: Int
    let name: String
    let baseExperience, height: Int
    let isDefault: Bool
    let order, weight: Int
    let abilities: [Ability]
    let forms: [NameURLResponseDTO]
    let gameIndices: [GameIndex]
    let heldItems: [HeldItem]
    let locationAreaEncounters: String
    let moves: [Move]
    let species: NameURLResponseDTO
    let sprites: Sprites
    let cries: Cries
    let stats: [Stat]
    let types: [TypeElement]
    let pastTypes: [PastType]

    enum CodingKeys: String, CodingKey {
        case id, name
        case baseExperience = "base_experience"
        case height
        case isDefault = "is_default"
        case order, weight, abilities, forms
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case moves, species, sprites, cries, stats, types
        case pastTypes = "past_types"
    }
    
    // MARK: - Ability
    struct Ability: Decodable {
        let isHidden: Bool
        let slot: Int
        let ability: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case isHidden = "is_hidden"
            case slot, ability
        }
    }

    // MARK: - Cries
    struct Cries: Decodable {
        let latest, legacy: String
    }

    // MARK: - GameIndex
    struct GameIndex: Decodable {
        let gameIndex: Int
        let version: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }

    // MARK: - HeldItem
    struct HeldItem: Decodable {
        let item: NameURLResponseDTO
        let versionDetails: [VersionDetail]

        enum CodingKeys: String, CodingKey {
            case item
            case versionDetails = "version_details"
        }
    }

    // MARK: - VersionDetail
    struct VersionDetail: Decodable {
        let rarity: Int
        let version: NameURLResponseDTO
    }

    // MARK: - Move
    struct Move: Decodable {
        let move: NameURLResponseDTO
        let versionGroupDetails: [VersionGroupDetail]

        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }
    }

    // MARK: - VersionGroupDetail
    struct VersionGroupDetail: Decodable {
        let levelLearnedAt: Int
        let versionGroup, moveLearnMethod: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case versionGroup = "version_group"
            case moveLearnMethod = "move_learn_method"
        }
    }

    // MARK: - PastType
    struct PastType: Decodable {
        let generation: NameURLResponseDTO
        let types: [TypeElement]
    }

    // MARK: - TypeElement
    struct TypeElement: Decodable {
        let slot: Int
        let type: NameURLResponseDTO
    }

    // MARK: - GenerationV
    struct GenerationV: Decodable {
        let blackWhite: Sprites

        enum CodingKeys: String, CodingKey {
            case blackWhite = "black-white"
        }
    }

    // MARK: - GenerationIv
    struct GenerationIv: Decodable {
        let diamondPearl, heartgoldSoulsilver, platinum: Sprites

        enum CodingKeys: String, CodingKey {
            case diamondPearl = "diamond-pearl"
            case heartgoldSoulsilver = "heartgold-soulsilver"
            case platinum
        }
    }

    // MARK: - Versions
    struct Versions: Decodable {
        let generationI: GenerationI
        let generationIi: GenerationIi
        let generationIii: GenerationIii
        let generationIv: GenerationIv
        let generationV: GenerationV
        let generationVi: [String: Home]
        let generationVii: GenerationVii
        let generationViii: GenerationViii

        enum CodingKeys: String, CodingKey {
            case generationI = "generation-i"
            case generationIi = "generation-ii"
            case generationIii = "generation-iii"
            case generationIv = "generation-iv"
            case generationV = "generation-v"
            case generationVi = "generation-vi"
            case generationVii = "generation-vii"
            case generationViii = "generation-viii"
        }
    }

    // MARK: - Other
    struct Other: Decodable {
        let dreamWorld: DreamWorld
        let home: Home
        let officialArtwork: OfficialArtwork
        let showdown: Sprites

        enum CodingKeys: String, CodingKey {
            case dreamWorld = "dream_world"
            case home
            case officialArtwork = "official-artwork"
            case showdown
        }
    }

    // MARK: - Sprites
    class Sprites: Decodable {
        let backDefault: String?
        let backFemale: String?
        let backShiny: String?
        let backShinyFemale: String?
        let frontDefault: String?
        let frontFemale: String?
        let frontShiny: String?
        let frontShinyFemale: String?
        let other: Other?
        let versions: Versions?
        let animated: Sprites?

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backFemale = "back_female"
            case backShiny = "back_shiny"
            case backShinyFemale = "back_shiny_female"
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
            case other, versions, animated
        }
    }

    // MARK: - GenerationI
    struct GenerationI: Decodable {
        let redBlue, yellow: RedBlue

        enum CodingKeys: String, CodingKey {
            case redBlue = "red-blue"
            case yellow
        }
    }

    // MARK: - RedBlue
    struct RedBlue: Decodable {
        let backDefault, backGray, frontDefault, frontGray: String

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backGray = "back_gray"
            case frontDefault = "front_default"
            case frontGray = "front_gray"
        }
    }

    // MARK: - GenerationIi
    struct GenerationIi: Decodable {
        let crystal, gold, silver: Crystal
    }

    // MARK: - Crystal
    struct Crystal: Decodable {
        let backDefault, backShiny, frontDefault, frontShiny: String

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }

    // MARK: - GenerationIii
    struct GenerationIii: Decodable {
        let emerald: OfficialArtwork
        let fireredLeafgreen, rubySapphire: Crystal

        enum CodingKeys: String, CodingKey {
            case emerald
            case fireredLeafgreen = "firered-leafgreen"
            case rubySapphire = "ruby-sapphire"
        }
    }

    // MARK: - OfficialArtwork
    struct OfficialArtwork: Decodable {
        let frontDefault, frontShiny: String

        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }

    // MARK: - Home
    struct Home: Decodable {
        let frontDefault: String?
        let frontFemale: String?
        let frontShiny: String?
        let frontShinyFemale: String?

        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
        }
    }

    // MARK: - GenerationVii
    struct GenerationVii: Decodable {
        let icons: DreamWorld
        let ultraSunUltraMoon: Home

        enum CodingKeys: String, CodingKey {
            case icons
            case ultraSunUltraMoon = "ultra-sun-ultra-moon"
        }
    }

    // MARK: - DreamWorld
    struct DreamWorld: Decodable {
        let frontDefault: String?
        let frontFemale: String?

        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
        }
    }

    // MARK: - GenerationViii
    struct GenerationViii: Decodable {
        let icons: DreamWorld
    }

    // MARK: - Stat
    struct Stat: Decodable {
        let baseStat, effort: Int
        let stat: NameURLResponseDTO

        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort, stat
        }
    }
}
