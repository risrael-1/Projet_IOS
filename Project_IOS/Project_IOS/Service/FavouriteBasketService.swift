//
//  FavouriteBasketService.swift
//  Project_IOS
//
//  Created by Eduard Serban on 23/02/2021.
//

import Foundation

class FavouriteBasketService {
    public func list(completion: @escaping ([FavouriteBasket]) -> Void) -> Void {
        guard let matchURL = URL(string: "https://swift-api-basket.herokuapp.com/matchs") else {
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
            let res = matchs.compactMap(FavouriteBasketFactory.matchFromDictionary(_:))
            
            completion(res)
        }
        task.resume() // Lance le telechargement
    }
    
    public func create(favouriteBasket: FavouriteBasket, completion: @escaping (Bool) -> Void) -> Void {
        guard let addMatchToFavURL = URL(string: "https://swift-api-basket.herokuapp.com/matchs") else {
            completion(false)
            return
        }
        var request = URLRequest(url: addMatchToFavURL)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dict = FavouriteBasketFactory.dictionaryFromMatch(favouriteBasket)
        let data = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(false)
                return
            }
            completion(httpResponse.statusCode == 200)
        }
        task.resume()
    }
    
    public func delete(id: Int, completion: @escaping (Bool) -> Void) -> Void {
        guard let removeMatchFromFavourites = URL(string: "https://swift-api-basket.herokuapp.com/matchs/\(id)") else {
            completion(false)
            return
        }
        var request = URLRequest(url: removeMatchFromFavourites)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(false)
                return
            }
            completion(httpResponse.statusCode == 200)
        }
        task.resume()
    }
    
    public func isSaved(id: Int) -> Bool {
        guard let matchURL = URL(string: "https://swift-api-basket.herokuapp.com/matchs/\(id)") else {
            return false
        }
        var isSaved: Bool = true
        let task = URLSession.shared.dataTask(with: matchURL) { (data, response, err) in
            guard err == nil, let d = data else {
                print("toto")
                return
                
            }
            print(d)
            
            let matchAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            print(matchAny)
            if matchAny == nil {
                
                isSaved = false
            }
            
            
            
        }
        task.resume() // Lance le telechargement
        return isSaved
    }
    
}
