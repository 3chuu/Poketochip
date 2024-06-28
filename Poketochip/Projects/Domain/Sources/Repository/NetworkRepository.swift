//
//  NetworkRepository.swift
//  Domain
//
//  Created by cha_nyeong on 5/20/24.
//

import Foundation

import RxSwift

public protocol NetworkRepository {
    func getPokemonDetil(pokemonId: Int) -> Observable<PokemonDetail>
}
