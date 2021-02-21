//
//  LeagueService.swift
//  Project_IOS
//
//  Created by Eduard Serban on 15/02/2021.
//

import Foundation


class LeagueService {
    public func list(completion: @escaping ([League]) -> Void) -> Void {
        
        let headers = [
            "x-rapidapi-key": "c14f378c88msh1e277dfd2ed28e7p1c5586jsnfbed432bd5fe",
            "x-rapidapi-host": "api-basketball.p.rapidapi.com"
        ]
        
        guard let matchURL = URL(string: "https://api-basketball.p.rapidapi.com/leagues") else {
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
            let leagueAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let leagues = leagueAny as? [String:Any] else {
                completion([])
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(leagues) else {
                completion([])
                return
            }
            let res = apiResponse.response.compactMap(LeagueFactory.leagueFromDict(_:))
            completion(res)
        }
        task.resume()
    }
}
