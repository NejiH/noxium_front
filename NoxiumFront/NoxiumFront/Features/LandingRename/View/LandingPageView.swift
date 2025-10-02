//
//  LandingPageView.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI


struct LandingPageView: View {
    var body: some View {
        ZStack{
            Image(.backgroundShop)
                .ignoresSafeArea()
            VStack{
                HStack {
                    MoneyComponentView()
                    Spacer()
                    LevelComponentView()
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Text("Partie privée")
                        }
                        .padding()
                        .frame(width: 130)
                        .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25)
                    })
                    
                }
                .padding(.horizontal)
                
                ZStack{
                    ScenarioCardLandingComponent()
                        .offset(x: -20)
//                        .rotationEffect(Angle(degrees: -10))
                    ScenarioCardLandingComponent().offset(x: 20)
                    ScenarioCardLandingComponent()
                        
                }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    LandingPageView()
}
