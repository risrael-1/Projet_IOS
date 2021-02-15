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
              let type = dict["type"] as? String else {
            return nil
        }
        
        let id = dict["id"] as? Int
        let country = dict["country"] as? String
        let seasons = dict["seasons"] as? [String]
        let logo = dict["logo"] as? String
        let logoURL = logo != nil ? URL(string: logo!) : nil
        return League(id: id, name: name, type: type, logo: logoURL, country: country, seasons: seasons)
    }
}
