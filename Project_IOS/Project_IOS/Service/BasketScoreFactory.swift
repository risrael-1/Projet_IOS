//
//  BasketScoreFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketScoreFactory {
    public static func scoreFromDict(_ dict: [String: Any]) -> BasketScore? {
        
        let quarter1 = dict["quarter_1"] as? Int
        let quarter2 = dict["quarter_2"] as? Int
        let quarter3 = dict["quarter_3"] as? Int
        let quarter4 = dict["quarter_4"] as? Int
        let total = dict["total"] as? Int
        let overtime = dict["overtime"] as? Int
        return BasketScore(quarter1: quarter1, quarter2: quarter2, quarter3: quarter3, quarter4: quarter4, overtime: overtime, total: total)
    }
}
