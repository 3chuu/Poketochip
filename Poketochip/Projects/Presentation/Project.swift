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
    dependencies:
        [Module.domain.project,
         Module.common.project
        ] +
    [
        .SPM.snapKit,
        .SPM.rxSwift,
        .SPM.rxCocoa
    ]
)

