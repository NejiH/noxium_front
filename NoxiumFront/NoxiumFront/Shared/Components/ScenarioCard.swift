//
//  ScenarioCard.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 30/09/2025.
//

import SwiftUI

struct ScenarioCard: View {
    let viewModel = ProfileViewModel()
    var image: String
    var name: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 30.00, style: .circular))
                .shadow(radius: 5)
            
            
            VStack {
                Spacer()
                Text(name)
                    .font(.custom(viewModel.font, size: 25))
                    .foregroundStyle(.blue50)
                    .shadow(radius: 5)
                    .textCase(.uppercase)
                    .padding(.bottom, 15)
            }
        }
        .frame(maxWidth: 156, maxHeight: 173)    }
}

#Preview {
    let viewModel = ProfileViewModel()

    ScenarioCard(image: viewModel.user.scenarios[0].image, name: viewModel.user.scenarios[0].name)
}
