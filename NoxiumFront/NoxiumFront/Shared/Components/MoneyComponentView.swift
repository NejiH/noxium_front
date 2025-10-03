//
//  MoneyComponent.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct MoneyComponentView: View {
    
    var money: Int
    
    var body: some View {
        HStack{
            Image("coin")
            Spacer()
            Text("\(money)")
        }
        .padding()
        .frame(width: 100)
        .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25)
    }
}

#Preview {
    
    MoneyComponentView(money: 100)
}
