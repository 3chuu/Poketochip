//
//  DetailViewModel.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import Foundation
import Domain

import RxSwift
import RxCocoa

public final class DetailViewModel: BaseViewModelProtocol {
    private let getPokemonDetailUseCase: GetPokemonDetailUseCase
//    private let likePokemonUseCase: LikePokemonUseCase
    
    let pokemon = SamplePokemon()
    
    let pokemonReply = PublishSubject<PokemonDetail>()
        
    var dataSouce: [DetailCellCase] {
        let info1 = DetailCellCase.main(pokemon)
        let info2 = DetailCellCase.info(pokemon.info)
        let info3 = DetailCellCase.acquisitionPath(pokemon.acquisition)
        let info4 = DetailCellCase.evelution(pokemon.evolution)
        let info5 = DetailCellCase.stat(pokemon.stat)
        
        return [info1, info2, info3, info4, info5]
    }
    var dataSouceCount: Int {
        dataSouce.count
    }
    
    public init(getPokemonDetailUseCase: GetPokemonDetailUseCase, pokemonId: Int) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let touchBackPokemonEvent: Observable<Void>
        let touchFrontPokemonEvent: Observable<Void>
        let touchLikeEvent: Observable<Bool>
    }
    struct Output {
        let pokemon: Observable<PokemonDetail?>
    }
    
    func transform(input: Input) -> Output {
        let viewDidLoadObservable = input.viewDidLoad
        
        let viewDidLoad = viewDidLoadObservable
            .withUnretained(self)
            .flatMap { owner, _ -> Observable<PokemonDetail?> in
                return owner.getPokemonDetailUseCase.execute(pokemonId: 1)
            }
        
        _ = input.touchBackPokemonEvent
            .map { _ in
                
            }
        
        _ = input.touchFrontPokemonEvent
            .map { _ in
                
            }
        
        _ = input.touchLikeEvent
            .flatMap { bool -> Observable<Void> in
                print("like - \(bool)")
                return .just(())
            }
        
        return Output(
            pokemon: viewDidLoad
        )
    }
}
