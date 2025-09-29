//
//  MoneyComponent.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct MoneyComponentView: View {
    var body: some View {
        if #available(iOS 26.0, *) {
            HStack{
                Image("coin")
                Spacer()
                Text("100")
                
            }
            .padding()
            .frame(width: 100)
            
            .glassEffect(
                .clear
                    .tint(.black.opacity(0.19)) // teinte très subtile pour maximiser la transparence
                    .interactive(),
                in: .rect(cornerRadius: 30)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
        } else {
            HStack{
                Image("coin")
                Spacer()
                Text("100")
                
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius:30))
            .frame(width: 100)
            .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    MoneyComponentView()
}
