//
//  BasketMatchStatusFactory.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation

class BasketMatchStatusFactory {
    public static func statusFromElement(_ dict: [String: Any]) -> String? {
        guard let res = dict["long"] as? String else {
            return nil
        }
        return res
    }
}
