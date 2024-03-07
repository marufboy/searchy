//
//  ProductCard.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ProductCard: View {
    @Binding var product: Product
    
    var body: some View {
        VStack(alignment: .leading){
            ProductTileImage(product: $product)
                .padding(.bottom, 8)
            // Title product
            Text(product.name)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 4)
                .lineLimit(2) // Limiting to 2 lines for better appearance
            Spacer()
            Text(product.price.formatPrice())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.pink.opacity(0.8))
        }
        .frame(width: 150, height: 245)
    }
}

#Preview {
    ProductCard(product: .constant(TestData.products[0]))
}
