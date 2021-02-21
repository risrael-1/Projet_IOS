//
//  BasketCountryFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketCountryFactory {
    public static func countryFromElement(_ dict: [String: Any]) -> BasketCountry? {
        guard let name = dict["name"] as? String,
              let shortCode = dict["code"] as? String else {
            return nil
        }
        
        let id = dict["id"] as? Int
        let flag = dict["flag"] as? String
        let flagURL = flag != nil ? URL(string: flag!) : nil
        return BasketCountry(id: id, name: name, shortCode: shortCode, flag: flagURL)
    }
}
