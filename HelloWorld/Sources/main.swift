import Kitura
import HeliumLogger

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

// Handle HTTP GET requests to /name - Parsing URL Encoded Parameters (/name/<name>)
router.get("/name/:name") { 
	request, response, next in
    let name = request.parameters["name"] ?? ""
    try response.send("Hello \(name)").end()
    next()
}

// Handle HTTP GET requests to /name - Parsing Query Parameters (/name?name=<name>)
router.get("/name") {
    request, response, next in
    let name = request.queryParameters["name"] ?? ""
    try response.send("Hello \(name)").end()
    next()
}

// Handle HTTP POST requests to /name - Parsing String Posts (string in post body)
router.post("/name") {
	request, response, next in
    let name = try request.readString() ?? ""
    try response.send("Hello \(name)").end()
    next()
}


// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()