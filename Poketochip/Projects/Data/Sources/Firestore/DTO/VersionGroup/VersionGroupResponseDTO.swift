//
//  VersionGroupResponseDTO.swift
//  Data
//
//  Created by 윤지호 on 5/6/24.
//

import Foundation

struct VersionGroupResponseDTO: Decodable {
    let id: String
    let imageName: String
    let name: String
    let versions: [String]
}
