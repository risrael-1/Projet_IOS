//
//  FavouriteBasketFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 23/02/2021.
//

import Foundation

class FavouriteBasketFactory {
    public static func matchFromDictionary(_ dict: [String: Any]) -> FavouriteBasket? {
        guard let league = dict["league"] as? String,
              let date = dict["date"] as? String,
              let team1Any = dict["team1"] as? [String: Any],
              let team2Any = dict["team2"] as? [String: Any] else {
            return nil
        }
        
        let team1 = self.teamFromElement(team1Any)
        let team2 = self.teamFromElement(team2Any)
        let id = dict["id"] as? Int
        
        return FavouriteBasket(id: id, league: league, date: date, team1: team1, team2: team2)
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
    
    public static func elementFromTeam(_ team: Team) -> [String: Any] {
        var element: [String: Any] = [:]
        element["name"] = team.name
        element["score"] = team.score
        if let imageURL = team.logo {
            element["logo"] = imageURL.absoluteString
        }
        return element
    }
    
    public static func dictionaryFromMatch(_ fav: FavouriteBasket) -> [String: Any] {
            var dict: [String: Any] = [:]
            dict["league"] = fav.league
            dict["date"] = fav.date
            dict["team1"] = self.elementFromTeam(fav.team1)
            dict["team2"] = self.elementFromTeam(fav.team2)
            if let id = fav.id {
                dict["id"] = id
            }
            return dict
        }
    
    
    public static func favouriteFromBasketMatch(_ basketMatch: BasketballMatch) -> FavouriteBasket? {
        let league = basketMatch.league.name
        let date = basketMatch.date
        let id = basketMatch.id
        let team1 = Team(name: basketMatch.teams.home.name, score: basketMatch.teams.home.score.total ?? 0, logo: basketMatch.teams.home.logo)
        let team2 = Team(name: basketMatch.teams.away.name, score: basketMatch.teams.away.score.total ?? 0, logo: basketMatch.teams.away.logo)
        
        
        
        return FavouriteBasket(id: id, league: league, date: date, team1: team1, team2: team2)
    }
    
}
