//
//  League.swift
//  Project_IOS
//
//  Created by Eduard Serban on 15/02/2021.
//

import Foundation

class League: CustomStringConvertible {
    
    var id: Int?
    var name: String
    var type: String
    var logo: URL?
    var country: String?
    var seasons: [String]?
    var description: String {
        "League [\(self.id ?? 0), \(self.name), \(self.type), \(self.country ?? ""), \(self.seasons ?? ["Current"])]"
    }
    
    
    public init(id: Int?, name: String, type: String, logo: URL?, country: String?, seasons: [String]?){
        self.id = id
        self.name = name
        self.logo = logo
        self.type = type
        self.country = country
        self.seasons = seasons
    }
}
