import PackageDescription

let package = Package(
    name: "swiftserver",
    targets: [
      Target(name: "Application", dependencies: [ .Target(name: "Generated") ]),
      Target(name: "swiftserver", dependencies: [ .Target(name: "Application") ])
    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git",             majorVersion: 1, minor: 6),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git",       majorVersion: 1, minor: 6),
        .Package(url: "https://github.com/IBM-Swift/Configuration.git",      majorVersion: 0, minor: 2),
    ],
    exclude: ["src"]
)
