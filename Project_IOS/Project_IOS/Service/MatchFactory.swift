//
//  MatchFactory.swift
//  Project_IOS
//
//  Created by Raphael on 14/02/2021.
//

import Foundation

class MatchFactory {
    
    public static func matchFromDictionary(_ dict: [String: Any]) -> Foot? {
        guard let league = dict["league"] as? String,
              let round = dict["round"] as? String,
              let date = dict["date"] as? String,
              let team1Any = dict["team1"] as? [String: Any],
              let team2Any = dict["team2"] as? [String: Any] else {
            return nil
        }
        
        let team1 = self.teamFromElement(team1Any)
        let team2 = self.teamFromElement(team2Any)
        let id = dict["id"] as? Int
        
        return Foot(id: id, league: league, round: round, date: date, team1: team1, team2: team2)
    }
    
    public static func teamFromElement(_ element: [String: Any]) -> Team {
        guard let name = element["name"] as? String,
              let score = element["score"] as? Int else {
            return Team(name: "error", score: 0, logo: URL(string: "https://miro.medium.com/max/978/1*pUEZd8z__1p-7ICIO1NZFA.png"))
        }
        let logo = element["logo"] as? String
        let logoURL = logo != nil ? URL(string: logo!) : nil
        return Team(name: name, score: score, logo: logoURL)
        
    }
    
    
//    public static func dictionaryFromMatch(_ foot: Foot) -> [String: Any] {
//        var dict: [String: Any] = [:]
//        dict["league"] = foot.league
//        dict["intensity"] = foot.round
//        dict["price"] = foot.date
//        dict["team1"] = foot.team1
//        dict["team2"] = foot.team2
//        if let id = foot.id {
//            dict["id"] = id
//        }
//        return dict
//    }
}
