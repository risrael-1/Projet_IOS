//
//  BasketTeam.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation


class BasketTeams: CustomStringConvertible {
    var home: BasketTeam
    var away: BasketTeam
    var description: String{
        "\(self.home) VS \(self.away)"
    }
    
    public init(home: BasketTeam, away: BasketTeam){
        self.home = home
        self.away = away
    }
}

class BasketTeam: CustomStringConvertible {
    
    var id: Int?
    var name: String
    var logo: URL?
    var score: BasketScore
    var description: String{
        "Team[\(self.id ?? 0), \(name)]"
    }
    
    public init(id: Int?, name: String, logo: URL?, score: BasketScore){
        self.id = id
        self.name = name
        self.logo = logo
        self.score = score
    }
}
