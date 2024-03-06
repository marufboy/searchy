//
//  ProductTileImage.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ProductTileImage: View {
    var imageName: ImageResource
    @State var isFavorited: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.top, 30)
                .frame(width: 200, height: 200)
                .cornerRadius(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.black.opacity(0.15))
                )
            
            Button(action: {
                isFavorited.toggle()
            }) {
                Image(systemName: isFavorited ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isFavorited ? .red : .white)
                
                    .padding()
            }
            .padding(.top, 30)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout){
    ProductTileImage(imageName: .nikeShoe)
}
