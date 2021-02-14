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
    var round: Int
    var date: String
    var team1: String?
    var team2: String?
    var description: String {
        return "Matchs [\(self.id ?? 0), \(self.league), \(self.round), \(self.date), \(self.team1 ?? ""), \(self.team2 ?? "")]"
    }


    public init(id: Int?, league: String, round: Int, date: String, team1: String?, team2: String?) {
        self.id = id
        self.league = league
        self.round = round
        self.date = date
        self.team1 = team1
        self.team2 = team2
    }
}
