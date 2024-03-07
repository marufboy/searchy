//
//  ProductTileImage.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ProductTileImage: View {
    @Binding var product: Product
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            
            Button(action: {
                product.isFavorite.toggle()
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(.white) // Color of the circle
                        .frame(width: 40, height: 40) // Size of the circle
                    
                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .fontWeight(.bold)
                        .frame(width: 20, height: 20)
                        .foregroundColor(product.isFavorite ? .red : .gray)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout){
    ProductTileImage(product: .constant(TestData.products[0]))
}
