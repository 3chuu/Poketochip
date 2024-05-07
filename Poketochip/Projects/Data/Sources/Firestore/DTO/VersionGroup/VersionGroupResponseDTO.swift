//
//  VersionGroupResponseDTO.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation

public struct VersionGroupResponseDTO: Decodable {
    public let id: String
    public let imageName: String
    public let name: String
    public let versions: [String]
    
}
