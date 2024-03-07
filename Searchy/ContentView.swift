//
//  ContentView.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var controller = ProductController()
    @FocusState var isFocused: Bool
    
    let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            //MARK: Header searchbar and favorite toogle
            HStack(spacing: isFocused ? 0 : 16) {
                SearchBar(searchText: $controller.searchText, isFocused: $isFocused)
                FavoriteToggle(isFavorited: $controller.showOnlyFavorites, width: 22, height: 22)
                    .opacity(isFocused ? 0 : 1)
            }
            
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(controller.filteredProducts, id: \.id) { product in
                        ProductCard(product: Binding<Product>(
                            get : { product },
                            set: { newValue in
                                if let index = controller.products.firstIndex(where: { $0.id == product.id }) {
                                    controller.products[index] = newValue
                                }
                            }
                        ))
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
            controller.initiateProducts()
        }
    }
}

#Preview {
    ContentView()
}
