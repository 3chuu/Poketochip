//
//  Model.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import Foundation
import UIKit


struct SamplePokemon {
    var number: Int = 0035
    var name: String = "삐삐"
    var isFavorite: Bool = false
    var image: UIImage = UIImage()
    var introduce: String = "깜찍한 몸짓으로 인기 만점. 조용하고 깊은 산속에서 동료들과 살고 있다고 여겨지고 있다."
    
    
    var 획득방법: String = """
D/P와 PT에서 등장하는 장소는 천관산이다. 한자랑의 뒷마당에서도 가끔 등장하긴 하는데 여기까지 올 일은 없을 것이다.그리고 2세대 리메이크인 하트골드/소울실버는 기본적으로 2세대와 같지만, 성도에 사파리존이 추가되어 교환하지 않아도 스토리용으로 쓸 수 있다. 사파리존 에리어 중 꽃밭에서 밤에만 나온다. 여긴 달맞이산처럼 출현률이 낮지 않아서 조우 및 포획이 더 쉽다.
"""
    
    var info: SamplePokemonInfo = SamplePokemonInfo()
    var evolution: SamplePokemonEvolution = SamplePokemonEvolution()
    var stat: SamplePokemonStat = SamplePokemonStat()
}

struct SamplePokemonInfo {
    var category: String = "요정포켓몬"
    var type: String = "페어리"
    var height: Double = 0.6
    var weight: Double = 7.5
    var character: String = "몰랑"
}

struct SamplePokemonEvolution {
    var pokemons: [Pokemon] = [
        Pokemon(
            number: 0,
            name: "삐"
        ),
        Pokemon(
            number: 1,
            name: "삐삐"
        ),
        Pokemon(
            number: 2,
            name: "픽시"
        )
    ]
    struct Pokemon {
        var number: Int
        var name: String
        var image: UIImage = UIImage()
    }
}

struct SamplePokemonStat {
    var 체력: Int = 80
    var 공격: Int = 80
    var 방어: Int = 80
    var 특수공격: Int = 80
    var 특수방어: Int = 80
    var 스피드: Int = 80
    
    var totalStat: String {
        let totalStat = 체력 + 공격 + 방어 + 특수공격 + 특수방어 + 스피드
        return "총합: \(totalStat)"
    }
}
