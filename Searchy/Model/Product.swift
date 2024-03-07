//
//  Product.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI
import Observation

@Observable
class Product: Codable{
    var id = UUID()
    var isFavorite: Bool = false
    let name: String
    let image: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "imageURL"
        case price
    }
}
