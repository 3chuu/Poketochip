//
//  BagRepository.swift
//  Domain
//
//  Created by cha_nyeong on 6/18/24.
//

import Foundation
import RxSwift

public protocol BagsRepository {
    func getTool() -> Observable<Tool>
    func getBerry() -> Observable<Berry>
    func getPokemonBall() -> Observable<PokemonBall>
}
