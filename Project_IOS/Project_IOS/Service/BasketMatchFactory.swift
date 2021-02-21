//
//  BasketMatchFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketMatchFactory {
    public static func matchFromDict(_ dict: [String: Any]) -> BasketballMatch? {
        guard let date = dict["date"] as? String,
              let time = dict["time"] as? String,
              let timezone = dict["timezone"] as? String,
              let countryElement = dict["country"] as? [String: Any],
              let leagueElement = dict["league"] as? [String: Any],
              let teamsDict = dict["teams"] as? [String: Any],
              let scoreDict = dict["scores"] as? [String: Any],
              let statusElement = dict["status"] as? [String: Any],
              let country = BasketCountryFactory.countryFromElement(countryElement),
              let league = LeagueFactory.leagueFromMatchFromDict(leagueElement),
              let status = BasketMatchStatusFactory.statusFromElement(statusElement),
              let teams = BasketTeamFactory.teamsFromDict(teamsDict, dictScore: scoreDict) else {
            return nil
        }
        
        
        let id = dict["id"] as? Int
        return BasketballMatch(id: id, date: date, time: time, timezone: timezone, status: status, country: country, league: league, teams: teams)
    }
}
