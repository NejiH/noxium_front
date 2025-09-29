//
//  ScenarioCardComponent.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI

struct ScenarioCardLandingComponent: View {
    var body: some View {
        VStack{
            ZStack{
                Image(.scenarioHalloween)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270,height:300)
                    .clipped()
                    .cornerRadius(30)
                    
            }
            VStack{
                Text("Halloween")
                    .font(.custom("Musubi", size: 30))
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .padding(.bottom)
                    .foregroundStyle(.blue50)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis, nibh quis condimentum tincidunt, risus ipsum condimentum felis, sed malesuada nisl nisl tempus sapien. ")
            }
            .padding()
            
            
        }
        .frame(width: 270)
        .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25)
        
    }
}

#Preview {
    ScenarioCardLandingComponent()
}
