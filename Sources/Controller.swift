//
//  Controller.swift
//  alohaKitura
//
//  Created by Chris Huang on 15/03/2017.
//
//

import Foundation
import LoggerAPI
import SwiftyJSON
import Kitura
import CloudFoundryEnv
import Configuration

public class Controller {
    
    let router: Router
    let configManager: ConfigurationManager
    
    var url: String { return configManager.url }
    var port: Int { return configManager.port }
    
    init() throws {
    
        configManager = ConfigurationManager()
        router = Router()
        router.get("/", handler: getMain)
    }
    
    public func getMain(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        Log.debug("Get - / router handler...")
        
        var json = JSON([:])
        json["Aloha"].stringValue = "Beginner API with Swift, Kitura and Bluemix"
        json["myName"].stringValue = "DevXris"
        json["myOrg"].stringValue = "Individual Developer"
        
        try response.status(.OK).send(json: json).end()
    }
}
