//
//  Modules.swift
//  ProjectDescriptionHelpers
//
//  Created by 박기석 on 11/19/24.
//

import ProjectDescription
import TuistTemplate

public enum Module: String, CaseIterable {
    case app = "SwiftUIExample"
    case tests = "SwiftUIExampleTests"
}

extension Module: ModuleProtocol {
    public var product: Product {
        switch self {
        case .app: .app
        case .tests: .unitTests
        }
    }
    
    public var defaultPath: String {
        switch self {
        case .app: name
        case .tests: Module.app.defaultPath
        }
    }
    
    public var sources: SourceFilesList {
        switch self {
        case .app: [.glob(.path(defaultPath + "/Sources/**"), excluding: excludingSources)]
        case .tests: [.glob(.path(defaultPath + "/Tests/**"), excluding: excludingSources)]
        }
    }
    
    public var infoPlist: InfoPlist {
        switch self {
        case .app: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "",
                    "UIImageName": "",
                ],
            ])
        case .tests: .default
        }
    }
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .app: [.external(name: "ComposableArchitecture")]
        case .tests: [.target(name: Module.app.rawValue)]
        }
    }
}
