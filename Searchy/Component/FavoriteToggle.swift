//
//  FavoriteToggle.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct FavoriteToggle: View {
    @State var isFavorited = false
    
    var body: some View {
        Button(action: {
            isFavorited.toggle()
        }) {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
                .foregroundColor(isFavorited ? .red : .gray)
        }
    }
}

#Preview {
    FavoriteToggle()
}
