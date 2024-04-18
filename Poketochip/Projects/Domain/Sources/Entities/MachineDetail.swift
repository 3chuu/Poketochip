//
//  MachineDetail.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public struct MachineDetail {
    public let skillType: SkillType
    public let abilityType: AbilityType
    public let power: Double
    public let hitRate: Double
    public let pp: Int
}

public enum SkillType {
    case 스킬타입
}

public enum AbilityType {
    case 능력타입
}
