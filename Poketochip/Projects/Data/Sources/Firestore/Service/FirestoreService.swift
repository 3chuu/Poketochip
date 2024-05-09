//
//  FirestoreService.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import RxSwift

import Infrastructure

public final class FirestoreService: FirestoreServiceProtocol {
    public typealias FirestoreEndpoint = FirestoreEndpointRouter
    
    public static let shared = FirestoreService()
    private init() { }
    
    public func requestDocument<T: Decodable>(endpoint: FirestoreEndpoint, type: T.Type) -> Single<T> {
        guard let dbRef = endpoint.path as? DocumentReference else {
            return .error(FirestoreError.documentNotFound)
        }
        return dbRef.getDocumentSingle(type: type)
    }
    
    public func requestCollection<T: Decodable>(endpoint: FirestoreEndpoint, type: T.Type) -> Single<[T]> {
        guard let dbRef = endpoint.path as? CollectionReference else {
            return .error(FirestoreError.collectionNotFound)
        }
        return dbRef.getDocumentsSingle(type: type)
    }
}

