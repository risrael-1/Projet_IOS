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
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let matchs = matchAny as? [String:Any] else {
                completion([])
                print("ici")
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(matchs) else {
                completion([])
                print("ici")
                return
            }
            let res = apiResponse.response.compactMap(LeagueFactory.leagueFromDict(_:))
            print(res)
            completion(res)
        }
        task.resume() // Lance le telechargement
    }
}
