//
//  TagStyleViewModifier.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//

import SwiftUI

struct tagStyleModifier: ViewModifier {
    
    var padding: CGFloat
    var radius: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, padding * 1.5)
            .padding(.vertical, padding)
            .foregroundColor(color)
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .foregroundStyle(.ultraThinMaterial)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: 0, y: 0)
            )
    }
}

extension View {
    func tagStyle(padding: CGFloat = 3, radius: CGFloat = 5, color: Color = .secondary) -> some View {
        self.modifier(tagStyleModifier(padding: padding, radius: radius, color: color))
    }
}
