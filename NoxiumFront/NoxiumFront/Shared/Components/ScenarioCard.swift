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
                .frame(width: 156, height: 172)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 30.00, style: .circular))
                .shadow(radius: 5)
            
            
            VStack {
                Spacer()
                CapslockText(text: name, fontSize: 25, padding: 15)
                    .foregroundStyle(.blue50)
                    .shadow(radius: 5)
                    .padding(.bottom, 15)
            }
        }
        .frame(width: 156, height:173)
    }
}

#Preview {
    let viewModel = ProfileViewModel()
    
    ScenarioCard(image: viewModel.user.scenarios[0].image, name: viewModel.user.scenarios[0].name)
}
