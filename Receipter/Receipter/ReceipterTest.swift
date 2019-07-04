//
//  Receipt.swift
//  Receipter
//
//  Created by Jeroen Dunselman on 04/07/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation

class ReceipterTest {
    
    let taxRates = ["UT": 6.85, "NV": 8.0, "TX": 6.25, "AL": 4.00, "CA": 8.25]
    var orders: [Order] = []
    
    init() {
        if let rate = taxRates["UT"] {
            orders.append(Order(rate, [OrderLine("X", 2000, 2.50), OrderLine("Y", 3, 7.50)]))
        }
        if let rate = taxRates["TX"] {
            orders.append(Order(rate, [OrderLine("X", 123, 234.56), OrderLine("Y", 13, 17.50)]))
        }
        if let rate = taxRates["CA"] {
            orders.append(Order(rate,
                              [OrderLine("item Z", 2000, 102.50),
                               OrderLine("item Y", 23, 27.50),
                               OrderLine("item X", 223, 17.50),
                               OrderLine("Leonidas", 23, 27.50)]
            ))
        }

        _ = orders.map({$0.printReceipt()})
    }
 
}





/*
We manufacture a point of sale capable of issuing cash register tickets.
 
 Accept 4 inputs from the user for one or many items : * Label of item * Quantity of item * Price of item * letter state code
 
 With a given 2 letters state code, we can compute the tax rate
 
 With total price (without tax) we can compute a discount see tabular at end of subject.
 
 Output the recipe like :
 label of item     Quantity   Unit price   Total price
 label of item     Quantity   Unit price   Total price
 
 -----------------------------------------------------
 Total without taxes                             XXXXX
 Discout X%                                       -YYY
 Tax Y%                                           +ZZZ
 -----------------------------------------------------
 Total price                                    XXXXXX
 
 Order value
 Discount rate
 > 1000    3%
 > 5000    5%
 > 7000    7%
 > 10000    10%
 > 50000    15%
 */
