//
//  TestData.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import Foundation

struct TestData {
    static var products: [Product] = {
        guard let url = Bundle.main.url(forResource: "Shoes", withExtension: "json") else {
            print("Json file not found")
            return []
        }
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Product].self, from: data)
        return products
    }()
}
