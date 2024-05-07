//
//  ExampleCollection.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

import Infrastructure

public enum Collection: FirestoreCollection {
    case character
    case improvement
    case link
    case pokemon
    case productInformation
    case region
    case version
    case versionGroup
    case versionInformation
}

extension Collection {
    public var name: String {
        switch self {
        case .character:
            return "Character"
        case .improvement:
            return "Improvement"
        case .link:
            return "Link"
        case .pokemon:
            return "Pokemon"
        case .productInformation:
            return "ProductInformation"
        case .region:
            return "Region"
        case .version:
            return "Version"
        case .versionGroup:
            return "VersionGroup"
        case .versionInformation:
            return "VersionInformation"
        }
    }
}
