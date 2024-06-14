//
//  GetPokemonDetailUseCase.swift
//  Domain
//
//  Created by 윤지호 on 6/14/24.
//

import Foundation

import RxSwift

public protocol GetPokemonDetailUseCase {
    func execute(pokemonId: Int) -> Observable<PokemonDetail?>
}

public final class DefaultGetPokemonDetailUseCase: GetPokemonDetailUseCase {
    private let networkRepository: NetworkRepository
    
    public init(networkRepository: NetworkRepository) {
        self.networkRepository = networkRepository
    }
    
    public func execute(pokemonId: Int) -> Observable<PokemonDetail?> {
        return .just(nil)
    }
}
