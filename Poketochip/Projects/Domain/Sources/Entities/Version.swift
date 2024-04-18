//
//  Version.swift
//  Domain
//
//  Created by cha_nyeong on 4/17/24.
//

import Foundation

public class Version: Codable {
    public var id: Int = 0
    public var name: String = ""
    public var pokemonImageName: String = ""
    
    public init() { }
    
    public init(id: Int, name: String, pokemonImageName: String) {
        self.id = id
        self.name = name
        self.pokemonImageName = pokemonImageName
    }
}

protocol VersionProtocol {
    var id: Int { get }
    var generation: Int { get }
    var versionName: String { get }
}

public class SelectedVersion: VersionProtocol {
    static let shared = SelectedVersion()
    
    public var id: Int = 0
    public var generation: Int = 0
    public var versionName: String = ""
    public var version = Version()
    
    private init() {}
}
