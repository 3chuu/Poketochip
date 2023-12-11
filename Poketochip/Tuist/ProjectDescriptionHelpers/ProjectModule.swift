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
        }
    }
    
    public var path: ProjectDescription.Path {
            return .relativeToRoot("Projects/" + self.name)
        }
    
    public var project: TargetDependency {
           switch self {
           case .app:
               return .project(target: self.name, path: self.path, condition: nil)
           case .data:
               return .project(target: self.name, path: self.path, condition: nil)
           case .domain:
               return .project(target: self.name, path: self.path, condition: nil)
           case .presentation:
               return .project(target: self.name, path: self.path, condition: nil)
           case .infrastructure:
               return .project(target: self.name, path: self.path, condition: nil)
           }
       }
}

extension Module: CaseIterable { }
