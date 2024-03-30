//
//  GameVersionViewModel.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import Foundation

import RxSwift
import RxRelay

final class GameVersionSheetViewModel {
    let versions: [VersionModel]
    let selectedVersion: PublishRelay<VersionModel> = .init()
    
    private let disposeBag = DisposeBag()
    
    public init(versions: [VersionModel], selectedVersionSubject: PublishRelay<VersionModel>) {
        self.versions = versions
        self.selectedVersion
            .bind(to: selectedVersionSubject)
            .disposed(by: disposeBag)
    }
}
