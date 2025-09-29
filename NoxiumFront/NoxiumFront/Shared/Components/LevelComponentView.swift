//
//  LevelComponentView.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct LevelComponentView: View {
    var body: some View {
        HStack{
            Text("Niv.")
            Spacer()
            Text("23")
        }
        .padding()
        .frame(width: 100)
        .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25)
    }
}

#Preview {
    LevelComponentView()
}
