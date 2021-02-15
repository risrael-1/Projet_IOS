//
//  APIResponse.swift
//  Project_IOS
//
//  Created by Eduard Serban on 15/02/2021.
//

import Foundation

class APIResponse: CustomStringConvertible {
    
    var get: String
    var parameters: [String]?
    var errors: [String]?
    var results: Int
    var response: [[String: Any]]
    var description: String {
        "API-Response [\(self.get), \(self.parameters ?? ["No parameters"]), \(self.errors ?? ["No error"]), \(self.results), \(self.response)]"
    }

    public init(get: String, parameters: [String]?, errors: [String]?, results: Int, response: [[String: Any]]){
        self.get = get
        self.parameters = parameters
        self.errors = errors
        self.results = results
        self.response = response
    }

}
