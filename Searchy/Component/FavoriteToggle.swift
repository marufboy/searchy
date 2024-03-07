//
//  FavoriteToggle.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorited: Bool
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button(action: {
            isFavorited.toggle()
        }) {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
                .resizable()
                .foregroundColor(isFavorited ? .red : .gray)
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    FavoriteToggle(isFavorited: .constant(false), width: 20, height: 20)
}
