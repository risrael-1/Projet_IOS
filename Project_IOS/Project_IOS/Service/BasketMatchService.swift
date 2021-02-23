//
//  BasketMatchService.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketMatchService {
    public func listByLeague(league: League, completion: @escaping ([BasketballMatch]) -> Void) -> Void {
        
        let headers = [
            "x-rapidapi-key": "c14f378c88msh1e277dfd2ed28e7p1c5586jsnfbed432bd5fe",
            "x-rapidapi-host": "api-basketball.p.rapidapi.com"
        ]
        
        
        guard let matchURL = URL(string: "https://api-basketball.p.rapidapi.com/games?league=\(league.id ?? 0)&season=\(league.seasons ?? "2020-2021")") else {
            completion([])
            return
        }
        
        var request = URLRequest(url: matchURL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion([])
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let matchs = matchAny as? [String:Any] else {
                completion([])
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(matchs) else {
                completion([])
                return
            }
            let res = apiResponse.response.compactMap(BasketMatchFactory.matchFromDict(_:))
            completion(res)
        }
        task.resume()
    }
    
    public func getMatchInfo(id: Int, completion: @escaping (BasketballMatch?) -> Void) -> Void {
        let headers = [
            "x-rapidapi-key": "c14f378c88msh1e277dfd2ed28e7p1c5586jsnfbed432bd5fe",
            "x-rapidapi-host": "api-basketball.p.rapidapi.com"
        ]
        
        
        guard let matchURL = URL(string: "https://api-basketball.p.rapidapi.com/games?id=\(id)") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: matchURL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let matchs = matchAny as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(matchs) else {
                completion(nil)
                return
            }
            let res = BasketMatchFactory.matchFromDict(apiResponse.response[0])
            completion(res)
        }
        task.resume()
    }
    
    
}
