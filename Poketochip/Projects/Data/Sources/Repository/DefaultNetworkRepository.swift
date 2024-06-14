//
//  DefaultNetworkRepository.swift
//  Data
//
//  Created by cha_nyeong on 5/23/24.
//

import Foundation
import Domain

import RxSwift

public final class DefaultNetworkRepository: NetworkRepository {
    private let networkManager: NetworkProtocol
    
    public init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
//    public func getPokemonDetil(pokemonId: Int) -> Observable<PokemonDetail> {
//        let endpoint: NetworkEndpointRouter = .get(requestDTO: ExampleRequestDTO(name: "", id: nil))
//        return networkManager.request(endpoint)
//    }
}
