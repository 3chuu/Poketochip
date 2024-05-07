//
//  RxFireStore.swift
//  Infrastructure
//
//  Created by 윤지호 on 5/7/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

import RxSwift

public extension DocumentReference {
    func getDocumentSingle<T: Decodable>(type: T.Type) -> Single<T> {
        return Single.create { observer in
            self.getDocument(completion: { (snapshot, error) in
                if let snapshot = snapshot {
                    observer(.success(snapshot))
                } else if error != nil {
                    observer(.failure(FirestoreError.invalidPath))
                }
            })
            return Disposables.create()
        }
        .handleDocument(type: type)
    }
    
    func deleteSingle() -> Single<Void> {
        return Single.create { observer in
            self.delete { error in
                if let error = error {
                    observer(.failure(error))
                    return
                }
                observer(.success(()))
            }
            return Disposables.create()
        }
    }
}

public extension CollectionReference {
    func getDocumentsSingle<T: Decodable>(type: T.Type) -> Single<[T]> {
        return Single.create { observer in
            self.getDocuments(completion: { (snapshot, error) in
                if let snapshot = snapshot {
                    observer(.success(snapshot))
                } else if error != nil {
                    observer(.failure(FirestoreError.invalidPath))
                }
            })
            return Disposables.create()
        }
        .handleDocuments(type: type)
    }
}

public extension PrimitiveSequence where Trait == SingleTrait, Element == DocumentSnapshot {
    func handleDocument<T: Decodable>(type: T.Type) -> Single<T> {
        return flatMap { response in
            do {
                let documentData = try response.data(as: T.self)
                return Single.just(documentData)
            } catch {
                return Single.error(error)
            }
        }
    }
}

public extension PrimitiveSequence where Trait == SingleTrait, Element == QuerySnapshot {
    func handleDocuments<T: Decodable>(type: T.Type) -> Single<[T]> {
        return flatMap { responses in
            do {
                var result: [T] = []
                for document in responses.documents {
                    let temp = try document.data(as: T.self)
                    result.append(temp)
                }
                return Single.just(result)
            } catch {
                return Single.error(FirestoreError.parseError)
            }
        }
    }
}
