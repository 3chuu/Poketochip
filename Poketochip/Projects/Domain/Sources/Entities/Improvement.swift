//
//  Improvement.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public struct Improvement: Codable {
    public let title: String
    public let senderEmail: String?
    public let content: String
    
    func send(title: String, content: String) -> Bool {
        return false
    }
}
