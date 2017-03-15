import Foundation
import LoggerAPI
import HeliumLogger
import Kitura

do {
    HeliumLogger.use(.info)
    
    let controller = try Controller()
    Log.info("Server will be started on '\(controller.url)'")
    Kitura.addHTTPServer(onPort: controller.port, with: controller.router)
    Kitura.run()
    
} catch let error {
    Log.debug("Server did not start.")
    Log.debug(error.localizedDescription)
}
