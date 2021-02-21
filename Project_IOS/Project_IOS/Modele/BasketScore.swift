//
//  BasketScore.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import Foundation


class BasketScore: CustomStringConvertible {
    var quarter1: Int?
    var quarter2: Int?
    var quarter3: Int?
    var quarter4: Int?
    var overtime: Int?
    var total: Int?
    var description: String {
        "Score:[q1: \(String(describing: self.quarter1 ?? nil)), q2: \(String(describing: self.quarter2 ?? nil)), q3: \(String(describing: self.quarter3 ?? nil)), q4: \(String(describing: self.quarter4 ?? nil)), overtime: \(String(describing: self.overtime ?? nil)), ]"
    }
    
    public init(quarter1: Int?, quarter2: Int?, quarter3: Int?, quarter4: Int?, overtime: Int?, total: Int?){
        self.quarter1 = quarter1
        self.quarter2 = quarter2
        self.quarter3 = quarter3
        self.quarter4 = quarter4
        self.overtime = overtime
        self.total = total
    }
}
