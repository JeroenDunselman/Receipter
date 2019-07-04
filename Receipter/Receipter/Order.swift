//
//  Order.swift
//  Receipter
//
//  Created by Jeroen Dunselman on 04/07/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation

extension Double {
    func format() -> String {

        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current

        if let priceString = currencyFormatter.string(from: NSNumber(value: self)) {
            return priceString
        }
        return String(self)
    }
}

class Order {
    var items: [OrderLine] = []
    var totalWithoutTaxes: Double
    var discountRate: Int = 0
    var discount: Double = 0
    var discountedTotal: Double = 0
    
    var rate: Double = 0
    var tax: Double = 0
    var orderTotal: Double = 0
    
    init(_ rate: Double, _ items: [OrderLine]) {
        self.items = items
        self.rate = rate
        
        totalWithoutTaxes = items.reduce(0.0, {ar, el in return ar + el.lineTotal })
        discountRate = getDiscountRate(totalWithoutTaxes)
        discount = (Double(discountRate) / 100) * totalWithoutTaxes
        discountedTotal = totalWithoutTaxes - discount
        tax = (rate / 100) * discountedTotal
        orderTotal = discountedTotal + tax
    }
    
    
    
    public func printReceipt() {
        printOrderItems()
        print("---------")
        print("Total without taxes: \(totalWithoutTaxes.format())")
        print("Discount \(discountRate)%: -\(discount.format())")
        print("Tax \(rate)%: + \(tax.format())")
        print("---------")
        print("Total price: \(orderTotal.format())")
        print("*************************************")

    }
    
    private func printOrderItems() {
        _ = items.map({print($0.description())})
    }
    
    private func getDiscountRate(_ total: Double) -> Int {
        if total <= 1000 {  return 0}
        if total <= 5000 {  return 3}
        if total <= 7000 {  return 5}
        if total <= 10000 {  return 7}
        if total <= 50000 {  return 10}
        return 15
    }
}
