//
//  View+Ext.swift
//  Searchy
//
//  Created by Muhammad Afif Maruf on 07/03/24.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
