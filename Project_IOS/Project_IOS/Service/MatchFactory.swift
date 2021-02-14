//
//  MatchFactory.swift
//  Project_IOS
//
//  Created by Raphael on 14/02/2021.
//

import Foundation

class MatchFactory {
    
    public static func matchFromDictionary(_ dict: [String: Any]) -> Foot? {
        guard let league = dict["league"] as? String else {
            print("league")
            return nil
        }
        guard let round = dict["round"] as? Int else {
            print("rou")
            return nil
        }
        guard let date = dict["date"] as? String else {
            print("da")
            return nil
        }
        let id = dict["id"] as? Int
        let team1 = dict["team1"] as? String
        let team2 = dict["team2"] as? String
        
        
        return Foot(id: id, league: league, round: round, date: date, team1: team1, team2: team2)
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
