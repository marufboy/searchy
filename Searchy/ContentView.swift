//
//  ContentView.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //MARK: Header searchbar and favorite toogle
            HStack(spacing: 16){
                SearchBar()
                FavoriteToggle(width: 22, height: 22)
            }
            //TODO: Create list
            //TODO: Create filter by search
            //TODO: Create filter by search and favorite
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
