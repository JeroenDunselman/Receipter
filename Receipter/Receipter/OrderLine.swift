//
//  OrderLine.swift
//  Receipter
//
//  Created by Jeroen Dunselman on 04/07/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation
class OrderLine {
    let label: String
    let quantity: Int
    let price: Double
    let lineTotal: Double
    
    init(_ label: String, _ quantity: Int, _ price: Double) {
        self.label = label
        self.quantity = quantity
        self.price = price
        lineTotal = Double(quantity) * price
    }
    
    public func description() -> String {
        return "\(label) \(quantity) * \(price.format()) : \(lineTotal.format())"
    }
}
