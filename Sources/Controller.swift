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
    
    let vehicles: [Dictionary<String, Any>] = {
        return [["type": "bike", "maker": "Giant", "model": "Indeed Macchihato", "year": 1989],
                ["type": "motorbike","maker": "Yamaha", "model": "Jog 50", "year": 1999],
                ["type": "auto", "maker": "BMW", "model": "330ci", "year": 2007],
                ["type": "auto", "maker": "Mazda", "model": "CX5", "year": 2013]]
    }()
    
    init() throws {
    
        configManager = ConfigurationManager()
        router = Router()
        router.get("/", handler: getMain)
        router.get("/vehicles", handler: getVehicles)
        router.get("/vehicles/random", handler: getRandomVehicle)
    }
    
    public func getMain(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        Log.debug("Get - / router handler...")
        
        var json = JSON([:])
        json["alohaKitura"].stringValue = "Beginner API with Swift, Kitura and Bluemix"
        json["myName"].stringValue = "DevXris"
        json["myOrg"].stringValue = "Individual Developer"
        
        try response.status(.OK).send(json: json).end()
    }
    
    public func getVehicles(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        
        let json = JSON(vehicles)
        
        try response.status(.OK).send(json: json).end()
    }
    
    public func getRandomVehicle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        
        let index = Int(arc4random_uniform(UInt32(vehicles.count)))
        let json = JSON(vehicles[index])
        
        try response.status(.OK).send(json: json).end()
    }
}
