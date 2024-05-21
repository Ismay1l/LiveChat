//
//  CustomForegroundColor.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/21/24.
//

import SwiftUI

struct CustomForegroundColor: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

extension View {
    
    func customForegroundColor() -> some View {
        modifier(CustomForegroundColor())
    }
}
