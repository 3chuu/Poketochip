//
//  GameListViewModel.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import Common

import RxSwift
import RxRelay

public final class GameListViewModel {
    let nextViewController = CustomTabBarController(
        firstTabInfoVC: UINavigationController(rootViewController: GameInformationViewController(viewModel: .init())),
        secondTabFavoriteVC: UINavigationController(rootViewController: FavoritePokemonViewController(viewModel: .init())),
        pokemonTabVC: UINavigationController(rootViewController: BagViewController(viewModel: .init())),
        skillMachineTabVC: UINavigationController(rootViewController: BagViewController(viewModel: .init())),
        toolTabVC: UINavigationController(rootViewController: BagViewController(viewModel: .init()))
    )
    let selectedGameVersion: PublishRelay<VersionModel> = .init()
    
    public init() { }
}
