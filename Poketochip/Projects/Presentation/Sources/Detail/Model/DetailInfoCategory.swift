//
//  DetailInfoCategory.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import Foundation

enum DetailInfoCategory {
    case category
    case type
    case height
    case weight
    case character
    
    var type: String {
        switch self {
        case .category:
            return "분류"
        case .type:
            return "타입"
        case .height:
            return "키"
        case .weight:
            return "몸무게"
        case .character:
            return "특성"
        }
    }
}
