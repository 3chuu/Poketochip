//
//  Dependencies.swift
//  Config
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription

//이건 SPM 방법
public extension Package {
    static let rxSwift: Package = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement:  .upToNextMajor(from: "6.6.0"))
    static let snapKit: Package = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.6.0"))
    static let kingfisher: Package = .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.10.1"))
    static let alamofire: Package = .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.8.1"))
    static let swiftyJSON: Package = .remote(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", requirement: .upToNextMajor(from: "5.0.1"))
    static let firebase: Package = .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .exact("10.22.1"))
}
