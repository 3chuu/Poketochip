//
//  FirestoreRouter.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

import Infrastructure

public enum FirestoreEndpointRouter {
    case character(id: String)
    case versionGroup
}

extension FirestoreEndpointRouter: FirestoreEndpoint {
    public typealias FirestoreCollection = Collection
    
    public var path: FirestoreReference {
        switch self {
        case .character(let id):
            return firestore.collection(collection.name).document(id)
        case .versionGroup:
            return firestore.collection(collection.name)
        }
    }
    
    public var method: FirestoreMethod {
        switch self {
        case .versionGroup:
            return .getCollection
        case .character:
            return .getDocument
        }
    }
    
    public var collection: FirestoreCollection {
        switch self {
        case .character:
            return .character
        case .versionGroup:
            return .versionGroup
        }
    }
}
