//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "Poketochip",
    projects: Module.allCases.map { $0.path }
)
