//
//  VersionGroup.swift
//  Domain
//
//  Created by cha_nyeong on 4/17/24.
//

import Foundation

public struct VersionGroup: Codable {
    public let id: Int
    public let name: String
    public let imageName: String
    public let versions: [Version]
    
    public init(id: Int, name: String, imageName: String, versions: [Version]) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.versions = versions
    }
}
