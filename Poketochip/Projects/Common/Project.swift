//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 1/11/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.common.name,
    /// 필요시 SPM 추가하기
    dependencies:
        [
            .SPM.rxSwift
        ],
    resources: .default
)
