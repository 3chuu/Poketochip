//
//  GameVersionViewModel.swift
//  Presentation
//
//  Created by 마경미 on 14.03.24.
//

import Foundation

final class GameVersionViewModel {
    let version: VersionModel
    
    // coordinator 쓸 시 public 제거하기
    public init(version: VersionModel) {
        self.version = version
    }
}
