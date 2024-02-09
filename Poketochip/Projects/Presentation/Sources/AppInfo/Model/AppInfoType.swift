//
//  AppInfoCase.swift
//  Presentation
//
//  Created by 윤지호 on 2/8/24.
//

import Foundation

enum AppInfoType: CaseIterable {
    case answer
    case suggestion
    case openSource
    
    var title: String {
        switch self {
        case .answer:
            return "자주 묻는 답변"
        case .suggestion:
            return "오류 사항 문의하기 / 개선 사항 건의 하기"
        case .openSource:
            return "오픈소스 라이센스"
        }
    }
}
