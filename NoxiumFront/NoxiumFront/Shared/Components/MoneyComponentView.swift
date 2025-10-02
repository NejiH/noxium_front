//
//  MoneyComponent.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct MoneyComponentView: View {
    var body: some View {
        HStack{
            Image("coin")
            Spacer()
            Text("100")
        }
        .padding()
        .frame(width: 100)
        .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25)
    }
}

#Preview {
    MoneyComponentView()
}
