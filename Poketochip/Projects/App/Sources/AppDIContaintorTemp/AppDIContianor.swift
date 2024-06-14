//
//  AppDIContianor.swift
//  App
//
//  Created by 윤지호 on 6/14/24.
//

import Foundation

import Data
import Presentation
import Domain


public final class AppDIContianor: PresentaionDIProvider {
    static let shared = AppDIContianor()
    
    private init() { }
    
    public func makeDetailViewController(pokemonId: Int) -> DetailViewController {
        let viewModel = DetailViewModel(
            getPokemonDetailUseCase: DefaultGetPokemonDetailUseCase(
                networkRepository: DefaultNetworkRepository(
                    networkManager: NetworkManager.shared
                )
            ),
            pokemonId: pokemonId
        )
        return DetailViewController(viewModel: viewModel)
    }
}
