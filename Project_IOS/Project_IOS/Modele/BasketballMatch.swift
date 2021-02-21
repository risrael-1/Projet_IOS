//
//  BasketballMatch.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation


class BasketballMatch: CustomStringConvertible {
    
    var id: Int?
    var date: String
    var time: String
    var timezone: String
    var status: String
    var country: BasketCountry
    var league: League
    var teams: BasketTeams
    var description: String {
        "Match [\(self.id ?? 0), \(self.date), \(self.time), \(self.timezone), \(self.status), \(self.teams), \(self.country), \(self.league)]"
    }
    
    public init(id: Int?, date: String, time: String, timezone: String, status: String, country: BasketCountry, league: League, teams: BasketTeams){
        self.id = id
        self.date = date
        self.time = time
        self.timezone = timezone
        self.status = status
        self.country = country
        self.league = league
        self.teams = teams
    }
}
