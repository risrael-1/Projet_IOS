//
//  Team.swift
//  Project_IOS
//
//  Created by Raphael on 14/02/2021.
//

import Foundation

class Team: CustomStringConvertible {
    var name: String
    var score: Int
    var logo: URL?
    var description: String {
        "Team [\(self.name), \(self.score)]"
    }
    
    public init(name: String, score: Int, logo: URL?) {
        self.name = name
        self.score = score
        self.logo = logo
    }
}
