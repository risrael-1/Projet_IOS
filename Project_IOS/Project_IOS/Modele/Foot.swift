//
//  Foot.swift
//  Project_IOS
//
//  Created by Raphael on 14/02/2021.
//

import Foundation

class Foot: CustomStringConvertible {
    var id: Int?
    var league: String
    var round: String
    var date: String
    var team1: Team
    var team2: Team
    var description: String {
        return "Matchs [\(self.id ?? 0), \(self.league), \(self.round), \(self.date), \(self.team1), \(self.team2)]"
    }


    public init(id: Int?, league: String, round: String, date: String, team1: Team, team2: Team) {
        self.id = id
        self.league = league
        self.round = round
        self.date = date
        self.team1 = team1
        self.team2 = team2
    }
}
