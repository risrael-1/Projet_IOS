//
//  footService.swift
//  Project_IOS
//
//  Created by Raphael on 14/02/2021.
//

import Foundation

class FootService {
    public func list(completion: @escaping ([Foot]) -> Void) -> Void {
        guard let matchURL = URL(string: "https://swift-project-api.herokuapp.com/matchs") else {
            completion([])
            return
        }
        let task = URLSession.shared.dataTask(with: matchURL) { (data, response, err) in
            guard err == nil, let d = data else {
                completion([])
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let matchs = matchAny as? [ [String: Any] ] else {
                completion([])
                return
            }
            let res = matchs.compactMap(MatchFactory.matchFromDictionary(_:))
            completion(res)
        }
        task.resume() // Lance le telechargement
    }
    
    public func getMatchInfo(id: Int, completion: @escaping (Foot?) -> Void) -> Void {
        guard let matchURL = URL(string: "https://swift-project-api.herokuapp.com/matchs/\(id)") else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: matchURL) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let matchs = matchAny as? [String: Any] else {
                completion(nil)
                return
            }
            let res = MatchFactory.matchFromDictionary(matchs)
            completion(res)
        }
        task.resume()
    }
}
