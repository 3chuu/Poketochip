//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "App",
    dependencies: [
        Module.data,
        Module.domain,
        Module.presentation,
        Module.infrastructure
    ].map { $0.project },
    resources: .default

)

