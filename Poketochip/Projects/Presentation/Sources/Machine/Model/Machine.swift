//
//  Machine.swift
//  Presentation
//
//  Created by cha_nyeong on 2/7/24.
//

import Foundation
import Common

struct Machine {
    let machineId: Int
    let machineName: String
    let machineType: PokemonType
    let machineSort: MachineSort
    let power: Int
    let hit: Int
    let pp: Int
}


enum MachineSort {
    case special
    case physics
    case change
}
