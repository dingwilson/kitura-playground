import Foundation
import Kitura
import LoggerAPI
import Configuration
import Generated

public let router = Router()
public let manager = ConfigurationManager()
public var port: Int = 8080

public func initialize() throws {

    manager.load(file: "config.json", relativeFrom: .project)
           .load(.environmentVariables)

    port = manager["port"] as? Int ?? port

    router.all("/*", middleware: BodyParser())

    try initializeCRUDResources(manager: manager, router: router)
    initializeSwaggerRoute(path: ConfigurationManager.BasePath.project.path + "/definitions/swiftserver.yaml")
}

public func run() throws {
    Kitura.addHTTPServer(onPort: port, with: router)
    Kitura.run()
}