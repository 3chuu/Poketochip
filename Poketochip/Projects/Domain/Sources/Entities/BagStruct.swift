//
//  PokemonBall.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public protocol BagItemProtocol {
    var id: Int { get }
    var name: String { get }
    var imageName: String { get }
    var description: String { get }
    var obtainPath: String { get }
}

public struct Tool: BagItemProtocol {
    public let id: Int
    public let name: String
    public let imageName: String
    public let description: String
    public let obtainPath: String
}

public struct Berry: BagItemProtocol {
    public let id: Int
    public let name: String
    public let imageName: String
    public let description: String
    public let obtainPath: String
}

public struct PokemonBall: BagItemProtocol {
    public let id: Int
    public let name: String
    public let imageName: String
    public let description: String
    public let obtainPath: String
}
