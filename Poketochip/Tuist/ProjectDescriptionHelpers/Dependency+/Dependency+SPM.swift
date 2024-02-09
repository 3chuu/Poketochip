//
//  TargetDependency+.swift
//  Config
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let rxSwift: TargetDependency = .external(name: "RxSwift")
    static let rxCocoa: TargetDependency = .external(name: "RxCocoa")
    static let snapKit: TargetDependency = .external(name: "SnapKit")
    static let kingfisher: TargetDependency = .external(name: "Kingfisher")
    static let alamofire: TargetDependency = .external(name: "Alamofire")
    static let swiftyJSON: TargetDependency = .external(name: "SwiftyJSON")
}
