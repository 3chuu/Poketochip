//
//  Encoding+Extension.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/14/24.
//

import Foundation
import Alamofire

public extension Encodable {
    var requestable: Parameters {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else {
                return [:]
            }
            return dictionary
        } catch {
            return [:]
        }
    }
}
