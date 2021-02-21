//
//  BasketCountry.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketCountry: CustomStringConvertible {
    
    var id: Int?
    var name: String
    var shortCode: String
    var flag: URL?
    var description: String{
        "Country[\(self.id ?? 0), \(self.name), \(self.shortCode)]"
    }

    public init(id: Int?, name: String, shortCode: String, flag: URL?){
        self.id = id
        self.name = name
        self.shortCode = shortCode
        self.flag = flag
    }

}
