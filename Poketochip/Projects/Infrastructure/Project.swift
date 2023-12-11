//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.infrastructure.name,
    dependencies:
        [
            Module.data.project
        ] +
        [
            .SPM.alamofire,
            .SPM.kingfisher
        ]
)
