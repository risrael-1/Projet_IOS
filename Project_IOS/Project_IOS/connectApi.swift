//
//  connectApi.swift
//  Project_IOS
//
//  Created by Raphael on 25/01/2021.
//

import Foundation

let headers = [
    "x-rapidapi-key": "24f84cf5f6msh6e8c662434ca331p133436jsnc7a5572de03f",
    "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/leagues")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
