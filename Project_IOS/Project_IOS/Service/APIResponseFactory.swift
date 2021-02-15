//
//  APIResponseFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 15/02/2021.
//

import Foundation

class APIResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APIResponse? {
        guard let get = dict["get"] as? String,
              let results = dict["results"] as? Int,
              let response = dict["response"] as? [[String: Any]] else {
            return nil
        }
        
        let parameters = dict["parameters"] as? [String]
        let errors = dict["errors"] as? [String]
        return APIResponse(get: get, parameters: parameters, errors: errors, results: results, response: response)
    }
}
