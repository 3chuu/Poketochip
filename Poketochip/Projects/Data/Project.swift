//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.data.name,
    packages: [
        .rxSwift,
        .swiftyJSON
    ],
    dependencies:
        [
            Module.domain.project,
            Module.infrastructure.project,
            .package(product: "RxCocoa"),
            .package(product: "RxSwift"),
        ]
)
