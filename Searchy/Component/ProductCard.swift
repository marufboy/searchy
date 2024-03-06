//
//  ProductCard.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading){
            //TODO: Image product card with button love
            ProductTileImage(imageName: .nikeShoe)
                .padding(.bottom, 8)
            // Title product
            Text("Nike Air Force 107 SE(CJ1647-600)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 4)
                .lineLimit(2) // Limiting to 2 lines for better appearance
            // Price product
            Text("RP. \(formatPrice(1200000))")
                .font(.subheadline)
                .foregroundColor(.pink.opacity(0.8))
        }
        .frame(width: 200)
    }
    
    // Function to format price
    func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: price)) ?? ""
    }
}



#Preview {
    ProductCard()
}
