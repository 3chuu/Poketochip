//
//  TempFavoritePokemonSection.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import Foundation
//
//import RxDataSources

// 도메인 클래스 다이어그램 보고 네이밍 다시 설정하기
// rxdatasource => domain layer로 이동하기!
// type은 enum 만들기
struct PokemonCell {
    let number: Int
    let name: String
    let type: String
    let imageURL: String
}

extension PokemonCell {
    static var pokemons: [PokemonCell] {
        return [
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png"),
            .init(number: 35, name: "삐삐", type: "페어리", imageURL: "https://podicmaster.cdn3.cafe24.com/artworks/0035.png")
        ]
    }
}

//struct FavoritePokemonSection {
//  typealias Model = SectionModel<Int, Item>
//  
//  enum Item {
//    case main(PokemonCell)
//  }
//}
//
//extension FavoritePokemonSection.Item: Equatable {
//  
//}
