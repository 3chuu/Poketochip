//
//  FirestoreError.swift
//  Infrastructure
//
//  Created by 윤지호 on 5/7/24.
//

import Foundation

public enum FirestoreError: Error {
    case invalidPath
    case invalidType
    case collectionNotFound
    case documentNotFound
    case unknownError
    case parseError
    case invalidRequest
    case operationNotSupported
    case invalidQuery
    case operationNotAllowed
}
