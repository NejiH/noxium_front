//
//  ScenarioCardComponent.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct ScenarioCardLandingComponent: View {
    var opacity: Double = 0.4
    let scenario: Scenario
    var body: some View {
        VStack{
            ZStack{
                AsyncImage(url: URL(string: scenario.picture)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 300)
                                    .clipped()
                                    .cornerRadius(30)
                            } placeholder: {
                                ProgressView() // Spinner de chargement
                            }
                    
            }
            VStack{
                Text(scenario.name)
                    .font(.custom("Musubi", size: 30))
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .padding(.bottom)
                    .foregroundStyle(.blue50)
                
                Text(scenario.synopsis)
            }
            .padding()
            
            
        }
        .frame(maxWidth: 300)
        .glassCard(cornerRadius: 30, tintOpacity: opacity, strokeOpacity: 0.25)
        
    }
}

#Preview {
    ScenarioCardLandingComponent(scenario: Scenario(id: UUID(),name: "Simplon", synopsis: "Zak zak zak", picture: "Simplon", minAge: 3, map: "Montreuil", price: 22, createdAt: "2025-11-27"))
}
