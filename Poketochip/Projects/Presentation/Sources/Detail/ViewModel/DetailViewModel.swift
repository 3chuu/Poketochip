//
//  DetailViewModel.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import Foundation
import RxSwift

protocol DetailViewModelProtocol {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}

public final class DetailViewModel: DetailViewModelProtocol {
  let pokemon = SamplePokemon()
  
  var dataSouce: [DetailCellCase] {
    let info1 = DetailCellCase.main(pokemon)
    let info2 = DetailCellCase.info(pokemon.info)
    let info3 = DetailCellCase.acquisitionPath(pokemon.획득방법)
    let info4 = DetailCellCase.evelution(pokemon.evolution)
    let info5 = DetailCellCase.stat(pokemon.stat)
    
    return [info1, info2, info3, info4, info5]
  }
  var dataSouceCount: Int {
    dataSouce.count
  }

  struct Input {
    
  }
  struct Output {
    
  }
  
  func transform(input: Input) -> Output {
    return Output()
  }
}
