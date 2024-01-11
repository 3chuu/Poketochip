//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription

public enum Module {
    case app
    /// Data
    case data
    /// Domain
    case domain
    /// Presentation
    case presentation
    /// Infrastructure
    case infrastructure
    /// Common
    case common
}

extension Module {
    public var name: String {
        switch self {
        case .app:
            return "App"
        case .data:
            return "Data"
        case .domain:
            return "Domain"
        case .presentation:
            return "Presentation"
        case .infrastructure:
            return "Infrastructure"
        case .common:
            return "Common"
        }
    }
    
    public var path: ProjectDescription.Path {
            return .relativeToRoot("Projects/" + self.name)
        }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path, condition: nil)
    }
}

extension Module: CaseIterable { }
