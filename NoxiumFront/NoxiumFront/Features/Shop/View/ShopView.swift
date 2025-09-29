//
//  ShopView.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack {
            Image("background-shop")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Shop")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(.white))
                    Spacer()
                }.padding(20)
                
                // Version 1 de la frame (si la personne a IOS26
                if #available(iOS 26.0, *) {
                    VStack {
                        
                        HStack{
                            
                            Text("Nouveautés")
                                .font(.default)
                                .bold()
                                .foregroundStyle(Color(.white))
                            
                            Spacer()
                        }.padding(20)
                        
                        
                        HStack{
                            ForEach(ShopItems){ item in
                                ScrollView{
                                    ZStack {
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFill()
                                            .ignoresSafeArea()
                                    }.frame(width: 155, height: 173)
                                        .cornerRadius(20)
                                    
                                    
                                    
                                }
                            }
                        }
                        
                        
                    }
                    .frame(width: 360, height: 700)
                    // Applique le verre après les autres modificateurs d’apparence
                    .glassEffect(
                        .clear
                            .tint(.black.opacity(0.19)) // teinte très subtile pour maximiser la transparence
                            .interactive(),
                        in: .rect(cornerRadius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.25), lineWidth: 1)
                    )
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}

#Preview {
    ShopView()
}
