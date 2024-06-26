//
//  GetToolsDataUseCase.swift
//  Domain
//
//  Created by cha_nyeong on 6/23/24.
//

import Foundation

import RxSwift

public protocol GetToolsDataUseCase {
    func executeTool() -> Observable<Tool>
    func executeBerry() -> Observable<Berry>
    func executePokemonBall() -> Observable<PokemonBall>
}

public final class DefaultGetToolsDataUseCase: GetToolsDataUseCase {
    public func executeTool() -> Observable<Tool> {
        <#code#>
    }
    
    public func executeBerry() -> Observable<Berry> {
        <#code#>
    }
    
    public func executePokemonBall() -> Observable<PokemonBall> {
        <#code#>
    }
    
    private let bagsRepository: BagsRepository

    public init(bagsRepository: BagsRepository) {
        self.bagsRepository = bagsRepository
    }
}
