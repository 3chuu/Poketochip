//
//  Dependencies.swift
//  Config
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription

public extension Package {
    static let rxSwift: Package = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement:  .upToNextMinor(from: "6.6.0"))
    static let snapKit: Package = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.6.0"))
    static let kingfisher: Package = .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMinor(from: "7.10.1"))
    static let alamofire: Package = .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMinor(from: "5.8.1"))
    static let swiftyJSON: Package = .remote(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", requirement: .upToNextMinor(from: "5.0.1"))
}

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init([
        .rxSwift,
        .snapKit,
        .kingfisher,
        .alamofire,
        .swiftyJSON
    ]),
    platforms: [.iOS]
)
