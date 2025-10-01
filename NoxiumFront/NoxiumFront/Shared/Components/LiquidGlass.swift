// View+GlassFallback.swift
import SwiftUI

extension View {
    @ViewBuilder
    func glassCard(
        cornerRadius: CGFloat = 30,
        tintOpacity: Double = 0.19,
        strokeOpacity: Double = 0.25,
        interactive: Bool = false
    ) -> some View {
        if #available(iOS 26.0, *) {
            self
                .glassEffect(
                    interactive ? .clear.tint(.black.opacity(tintOpacity)).interactive()
                    : .clear.tint(.black.opacity(tintOpacity)),
                    in: .rect(cornerRadius: cornerRadius)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.black.opacity(strokeOpacity), lineWidth: 1)
                )
        } else {
            self
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.black.opacity(strokeOpacity), lineWidth: 1)
                )
        }
    }
}
