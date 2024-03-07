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
    var products: [Product]         = []
    var searchText: String          = ""
    var showOnlyFavorites: Bool     = false
    
    var filteredProducts: [Product] {
        var filters = products
        if showOnlyFavorites && !searchText.isEmpty {
            filters = filters.filter { $0.isFavorite && $0.name.lowercased().contains(searchText.lowercased()) }
        } else if showOnlyFavorites {
            filters = filters.filter { $0.isFavorite }
        } else if !searchText.isEmpty {
            filters = filters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        return filters
    }
    
    func initiateProducts() {
        self.loadProducts()
        if self.products.isEmpty {
            self.saveTestDataToUserDefaults()
        }
    }
    
    func loadProducts() {
        if let data = UserDefaults.standard.data(forKey: "products"),
           let decodedProducts = try? PropertyListDecoder().decode([Product].self, from: data) {
            self.products = decodedProducts
            print("USER Default Has data product")
            
        }
    }
    
    func saveTestDataToUserDefaults() {
        if let encodedData = try? PropertyListEncoder().encode(TestData.products) {
            UserDefaults.standard.set(encodedData, forKey: "products")
            self.products = TestData.products
        }
    }
}
