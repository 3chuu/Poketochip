//
//  FirestoreEndpoint.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public protocol FirestoreEndpoint {
    associatedtype FirestoreCollection
    
    var path: FirestoreReference { get }
    var method: FirestoreMethod { get }
    var firestore: Firestore { get }
    var collection: FirestoreCollection { get }
}

public extension FirestoreEndpoint{
    var firestore: Firestore {
        return Firestore.firestore()
    }
}

public enum FirestoreMethod {
    case getCollection
    case getDocument
    //  case addDocument
    //  case removeDocument
}

public protocol FirestoreReference {
    
}

public enum FirestorePath {
    case collection(reference: CollectionReference)
    case document(reference: DocumentReference)
}

extension DocumentReference: FirestoreReference { }
extension CollectionReference: FirestoreReference { }

public protocol FirestoreCollection {
    var name: String { get }
}
