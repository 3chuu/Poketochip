//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.presentation.name,
    packages: [
        .snapKit,
        .rxSwift,
        .kingfisher,
    ],
    dependencies:
        [
            Module.domain.project,
            Module.common.project
        ] 
    +
        [
            .package(product: "Kingfisher"),
            .package(product: "SnapKit"),
            .package(product: "RxCocoa"),
            .package(product: "RxSwift"),
        ]
)

