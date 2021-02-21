//
//  LeagueFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 15/02/2021.
//

import Foundation

class LeagueFactory {
    public static func leagueFromDict(_ dict: [String: Any]) -> League? {
        guard let name = dict["name"] as? String,
              let type = dict["type"] as? String,
              let seasonsDict = dict["seasons"] as? [[String: Any]] else {
            return nil
        }
        
        let id = dict["id"] as? Int
        let country = dict["country"] as? String
        var leagueSeason: String = ""
        
        let logo = dict["logo"] as? String
        let logoURL = logo != nil ? URL(string: logo!) : nil
        let allSeasons = seasonsDict.compactMap(self.seasonFromDict(_:))
        
        for season in allSeasons {
            if season.current {
                leagueSeason = season.season
            }
        }
        
        
        
        return League(id: id, name: name, type: type, logo: logoURL, country: country, seasons: leagueSeason)
    }
    
    public static func seasonFromDict(_ dict: [String: Any]) -> Season? {
        guard let season = dict["season"] as? String,
              let current = dict["current"] as? Bool else {
            return nil
        }
        return Season(season: season, current: current)
    }
    
    public static func leagueFromMatchFromDict(_ dict: [String: Any]) -> League? {
        guard let name = dict["name"] as? String,
              let type = dict["type"] as? String else {
            return nil
        }
        
        let id = dict["id"] as? Int
        let logo = dict["logo"] as? String
        let season = dict["season"] as? String
        let logoURL = logo != nil ? URL(string: logo!) : nil
        
        
        
        return League(id: id, name: name, type: type, logo: logoURL, country: nil, seasons: season)
    }
}
