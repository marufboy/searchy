//
//  Product.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

class Product: Codable {
    var id = UUID()
    let name: String
    let image: String
    let price: String
    var isFavorite: Bool
}
