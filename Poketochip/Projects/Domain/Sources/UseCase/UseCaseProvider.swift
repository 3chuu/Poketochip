//
//  UseCaseProvider.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public protocol UseCaseProvider {
    func makeLikesUseCase() -> LikesUseCase
    func makeSendImprovementUseCase() -> SendImprovementUseCase
    func makeGetDataUseCase() -> GetDataUseCase
}
