//
//  Int+Ext.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import Foundation

extension Int {
    func formatPrice() -> String {
        // Format the price as needed, for example, converting to currency format
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR" // Set the currency code to Indonesian Rupiah
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

