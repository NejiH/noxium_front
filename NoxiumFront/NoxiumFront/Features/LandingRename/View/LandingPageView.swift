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
            Image(.backgroundProfile)
                .ignoresSafeArea()
            
            HStack {
                MoneyComponentView()
                Spacer()
                LevelComponentView()
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    if #available(iOS 26.0, *) {
                        HStack{
                            Text("Partie privée")
                            
                            
                        }
                        .padding()
                        .frame(width: 130)
                        
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
                            Text("Partie privée")
                            
                        }
                        .padding()
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius:30))
                        .frame(width: 130)
                        .background(.ultraThinMaterial)
                    }
                })
                
            }
            .padding(.horizontal)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    LandingPageView()
}

