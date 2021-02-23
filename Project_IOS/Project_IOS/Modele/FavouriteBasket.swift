//
//  FavouriteBasket.swift
//  Project_IOS
//
//  Created by Eduard Serban on 23/02/2021.
//

import Foundation

class FavouriteBasket: CustomStringConvertible {
    var id: Int?
    var league: String
    var date: String
    var team1: Team
    var team2: Team
    var description: String {
        return "Matchs [\(self.id ?? 0), \(self.league), \(self.date), \(self.team1), \(self.team2)]"
    }


    public init(id: Int?, league: String, date: String, team1: Team, team2: Team) {
        self.id = id
        self.league = league
        self.date = date
        self.team1 = team1
        self.team2 = team2
    }
}
