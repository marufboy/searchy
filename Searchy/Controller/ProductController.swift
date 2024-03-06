//
//  ProductController.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import Foundation
import Observation

@Observable
class ProductController {
    var products: [Product] = []
    
    var filteredProductbyFavorite: [Product] {
        let favoritedProducts = products.filter { $0.isFavorite }
        return favoritedProducts
    }
    
    func toggleFavorite(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isFavorite.toggle()
        }
    }
    
    func search(keyword: String) -> [Product] {
        guard !keyword.isEmpty else { return products }
        return products.filter { $0.name.lowercased().contains(keyword.lowercased()) }
    }
}
