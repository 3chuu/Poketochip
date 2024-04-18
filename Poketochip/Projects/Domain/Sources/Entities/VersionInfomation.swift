//
//  VersionInfomation.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation
import Common

public struct VersionInformation: Codable {
    public let legendaryPokemon: Pokemon
    public let protagonists: [Character]
    public let partnerPokemon: [Pokemon]
    public let region: Region
    public let description: String
    public let productInformation: ProductInformation
}
