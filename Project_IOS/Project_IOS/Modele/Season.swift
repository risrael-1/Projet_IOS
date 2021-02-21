//
//  Season.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class Season: CustomStringConvertible {
    var season: String
    var current: Bool
    
    var description: String {
        "Season: \(self.season)"
    }
    
    public init(season: String, current: Bool){
        self.season = season
        self.current = current
    }
}
