//
//  ProductControllerTest.swift
//  SearchyTests
//
//  Created by Muhammad Afif Maruf on 07/03/24.
//

import XCTest
@testable import Searchy

final class ProductControllerTest: XCTestCase {
    
    var productController: ProductController!
    
    override func setUp() {
        super.setUp()
        productController = ProductController()
        productController.initiateProducts()
    }
    
    override func tearDown() {
        productController = nil
        super.tearDown()
    }
    
    func testSearchProductNoResult() {
        // Arrange
        productController.searchText = "Test"
        
        // Act
        let filteredProducts = productController.filteredProducts
        
        // Assert
        XCTAssertEqual(filteredProducts.count, 0)
    }
    
    func testSearchProductInputLowercasedHasResult() {
        // Arrange
        productController.searchText = "superstar"
        
        // Act
        let filteredProducts = productController.filteredProducts
        
        // Assert
        XCTAssertFalse(filteredProducts.isEmpty)
        XCTAssertEqual(filteredProducts.first?.name, "Superstar")
    }
    
    func testProductNoFavorite() {
        // Arrange
        productController.showOnlyFavorites = true
        
        // Act
        let filteredProducts = productController.filteredProducts
        
        // Assert
        XCTAssertEqual(filteredProducts.count, 0)
    }
    
    func testNoSearchNoFavoriteProducts() {
        // Arrange
        let filteredProducts = productController.filteredProducts
        
        // Assert
        XCTAssertEqual(filteredProducts.count, productController.products.count)
        XCTAssertEqual(filteredProducts.map { $0.id }, productController.products.map { $0.id })
    }
    
    func testFilterFavoriteWithSearchText() {
        // Arrange
        productController.showOnlyFavorites = true
        productController.searchText = "nike"
        
        // Act
        let filteredProducts = productController.filteredProducts
        
        // Assert
        XCTAssertTrue(productController.showOnlyFavorites)
        XCTAssertFalse(productController.searchText.isEmpty)
        XCTAssertEqual(filteredProducts.count, 0) //Assume no favorite in first call data
    }
    
    func testSaveTestDataToUserDefaults() {
        // Act
        productController.saveTestDataToUserDefaults()
        
        // Arrange
        let savedProductsData = UserDefaults.standard.data(forKey: "products")
        let savedProducts = try? PropertyListDecoder().decode([Product].self, from: savedProductsData!)
        
        // Assert
        XCTAssertEqual(savedProducts?.first?.name, TestData.products.first?.name)
    }
    
    func testLoadProductsFromUserDefaults() {
        // Arrange
        UserDefaults.standard.set(try? PropertyListEncoder().encode(TestData.products), forKey: "products")
        
        // Act
        productController.loadProducts()
        
        // Assert
        XCTAssertEqual(productController.products.first?.name, TestData.products.first?.name)
        XCTAssertFalse(productController.products.isEmpty)
    }
    
    func testInitiateProductsWhenEmpty() {
        // Arrange
        productController.products = []
        
        // Act
        productController.initiateProducts()
        
        // Assert
        XCTAssertEqual(productController.products.count, TestData.products.count)
        for (index, product) in productController.products.enumerated() {
            XCTAssertEqual(product.name, TestData.products[index].name)
            XCTAssertEqual(product.image, TestData.products[index].image)
            XCTAssertEqual(product.price, TestData.products[index].price)
            XCTAssertEqual(product.isFavorite, TestData.products[index].isFavorite)
        }
    }
}
