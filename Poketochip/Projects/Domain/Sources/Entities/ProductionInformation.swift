//
//  ProductionInformation.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public struct ProductInformation: Codable {
    public let imageName: String
    public let name: String
    public let releaseDate: Date
    public let device: [Device]
    public let genre: String
    public let playersCount: Int
    public let producer: String
    public let price: Int
    public let linkUrl: String
    
    func openUrl() {
        
    }
}
