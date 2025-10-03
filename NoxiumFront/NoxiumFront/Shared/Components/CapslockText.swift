//
//  CapslockText.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 01/10/2025.
//

import SwiftUI

struct CapslockText: View {
    var viewModel = ProfileViewModel()
    var text: String
    var fontSize: CGFloat
    var padding: CGFloat
    
    var body: some View {
            Text(text)
            .font(.custom(viewModel.font, size: fontSize))
                .fontWeight(.bold)
                .textCase(.uppercase)
                .padding(.top, padding)
        }
}

#Preview {
    var viewModel = ProfileViewModel()
    
    CapslockText(text: "Arnaud", fontSize: 25, padding: 10)
}
