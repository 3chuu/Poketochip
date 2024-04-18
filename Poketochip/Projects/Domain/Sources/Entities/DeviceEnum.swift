//
//  DeviceEnum.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public enum Device: Codable {
    case nintendo
    case nintendoSwitch
    case nintendoGameboy
    case nintendoConsole
    
    var description: String {
        switch self {
        case .nintendo: "닌텐도"
        case .nintendoSwitch: "닌텐도스위치"
        case .nintendoGameboy: "닌텐도게임보이"
        case .nintendoConsole: "닌텐도콘솔"
        }
    }
}
