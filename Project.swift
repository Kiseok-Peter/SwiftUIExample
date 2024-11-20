import ProjectDescription
import ProjectDescriptionHelpers
import TuistTemplate

let project = Project(
    name: "SwiftUIExample",
    settings: .settings(debug: .init().swiftOptimizationLevel(.oNone)),
    targets: Module.allCases.map { Target(with: $0) }
)
