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
    dependencies: 
        [
            Module.domain.project,
            Module.infrastructure.project
        ] +
        [
            .SPM.swiftyJSON,
            .SPM.rxSwift
        ]
)
