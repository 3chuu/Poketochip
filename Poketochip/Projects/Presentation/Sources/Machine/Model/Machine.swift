//
//  Machine.swift
//  Presentation
//
//  Created by cha_nyeong on 2/7/24.
//

import Foundation
import Common

struct Machine {
    let generation: Int
    let machineId: Int
    let machineName: String
    let machineType: PokemonType
    let machineSort: MachineSort
    let power: Int
    let hit: Int
    let pp: Int
    let description: String
    let isVision: Bool
}


enum MachineSort: String {
    case special = "특수"
    case physics = "물리"
    case change = "변화"
}

extension Machine {
    static let dummyData: [Machine] = [
        .init(generation: 1, machineId: 1, machineName: "마음의눈", machineType: .psychic, machineSort: .change, power: 0, hit: 0, pp: 20, description: "상대방의 능력을 복사한다", isVision: true),
        .init(generation: 1, machineId: 2, machineName: "불꽃세례", machineType: .fire, machineSort: .special, power: 100, hit: 100, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 3, machineName: "물의파동", machineType: .water, machineSort: .special, power: 90, hit: 100, pp: 15, description: "상대방을 물에 잠긴다", isVision: false),
        .init(generation: 1, machineId: 4, machineName: "전기쇼크", machineType: .electric, machineSort: .special, power: 90, hit: 100, pp: 15, description: "상대방을 감전시킨다", isVision: false),
        .init(generation: 1, machineId: 5, machineName: "풀의속삭임", machineType: .grass, machineSort: .special, power: 90, hit: 100, pp: 15, description: "상대방을 잠들게 한다", isVision: false),
        .init(generation: 1, machineId: 6, machineName: "얼음빔", machineType: .ice, machineSort: .special, power: 90, hit: 100, pp: 15, description: "상대방을 얼린다", isVision: false),
        .init(generation: 1, machineId: 7, machineName: "용의숨결", machineType: .dragon, machineSort: .special, power: 90, hit: 40, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 8, machineName: "악의파동", machineType: .dark, machineSort: .special, power: 90, hit: 60, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 9, machineName: "악의파동", machineType: .dark, machineSort: .change, power: 90, hit: 100, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 10, machineName: "악의파동", machineType: .fairy, machineSort: .change, power: 90, hit: 30, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 12, machineName: "악의파동", machineType: .shadow, machineSort: .change, power: 90, hit: 100, pp: 15, description: "상대방을 불태운다", isVision: false),
        .init(generation: 1, machineId: 11, machineName: "악의파동", machineType: .rock, machineSort: .change, power: 90, hit: 100, pp: 15, description: "상대방을 불태운다", isVision: false),
    ]
}
