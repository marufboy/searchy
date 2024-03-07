//
//  ProductModelTest.swift
//  SearchyTests
//
//  Created by Muhammad Afif Maruf on 07/03/24.
//

import XCTest
@testable import Searchy

final class ProductModelTest: XCTestCase {
    
    var products = TestData.products
    
    func testProductDecoding() {
        // Arrange
        let jsonData = try! JSONEncoder().encode(products)
        
        // Act
        do {
            let decodedProducts = try JSONDecoder().decode([Product].self, from: jsonData)
            
            // Assert
            XCTAssertEqual(decodedProducts.count, products.count)
            for (index, product) in decodedProducts.enumerated() {
                XCTAssertEqual(product.name, products[index].name)
                XCTAssertEqual(product.image, products[index].image)
                XCTAssertEqual(product.price, products[index].price)
                XCTAssertEqual(product.isFavorite, products[index].isFavorite)
            }
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
    
    func testProductFormatPriceText() {
        //Arrange
        let product = products[0]
        
        //Act
        let formattedPrice = product.price.formatPrice()
        print(formattedPrice)
        
        XCTAssertTrue(formattedPrice.hasPrefix("Rp"))
        XCTAssertEqual(formattedPrice.dropFirst(3), "2.240.000")
    }
}
