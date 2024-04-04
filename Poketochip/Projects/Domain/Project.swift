//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.domain.name, 
    packages: [
        .rxSwift,
        .swiftyJSON
    ],
    dependencies: [
        .package(product: "RxCocoa"),
        .package(product: "RxSwift"),
    ]
)
