//
//  GameVersionViewModel.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import Foundation

final class GameVersionSheetViewModel {
    let versions: [VersionModel]
    
    public init(versions: [VersionModel]) {
        self.versions = versions
    }
}
