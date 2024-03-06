//
//  SearchBar.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.secondary : Color.accentColor
                )
            
            TextField("Search name product here ...", text: $searchText)
                .foregroundStyle(Color.accentColor)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.background)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        )
        .padding()
    }
}

#Preview {
    Group{
        SearchBar(searchText: .constant("")).previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        SearchBar(searchText: .constant("")).previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
