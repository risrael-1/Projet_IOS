//
//  BasketTeamFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketTeamFactory {
    public static func teamsFromDict(_ dict: [String: Any], dictScore: [String: Any]) -> BasketTeams? {
        guard let homeElement = dict["home"] as? [String: Any],
              let scoreHomeElement = dictScore["home"] as? [String: Any],
              let awayElement = dict["away"] as? [String: Any],
              let scoreAwayElement = dictScore["away"] as? [String: Any],
              let home = self.teamFromElement(homeElement, scoreElement: scoreHomeElement),
              let away = self.teamFromElement(awayElement, scoreElement: scoreAwayElement) else {
            return nil
        }
        
        
        
        
        return BasketTeams(home: home, away: away)
    }
    
    public static func teamFromElement(_ dict: [String: Any], scoreElement: [String: Any]) -> BasketTeam? {
        guard let name = dict["name"] as? String,
              let score = BasketScoreFactory.scoreFromDict(scoreElement) else {
            return nil
        }
        
        let id = dict["id"] as? Int
        let logo = dict["logo"] as? String
        let logoURL = logo != nil ? URL(string: logo!) : nil
        
        
        return BasketTeam(id: id, name: name, logo: logoURL, score: score)
    }
}
