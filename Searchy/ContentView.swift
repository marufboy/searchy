//
//  ContentView.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var controller = ProductController()
    
    let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            //MARK: Header searchbar and favorite toogle
            HStack(spacing: 16) {
                SearchBar(searchText: $controller.searchText)
                FavoriteToggle(isFavorited: $controller.showOnlyFavorites, width: 22, height: 22)
            }
            
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(controller.filteredProducts, id: \.id) { product in
                        ProductCard(product: Binding<Product>(
                            get : { product },
                            set: { newValue in
                                if let index = controller.products.firstIndex(where: { $0.id == product.id }) {
                                    controller.products[index] = newValue
                                    controller.saveProducts()
                                }
                            }
                        ))
                        .environment(controller)
                    }
                }
                .padding()
            }
        }
        .padding()
        .onTapGesture{
            self.endTextEditing()
        }
        .onAppear{
            controller.loadProducts()
            if controller.products.isEmpty {
                controller.saveTestDataToUserDefaults()
            }
        }
    }
}

#Preview {
    ContentView()
}
