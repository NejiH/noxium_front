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
                
                VStack {
                    
                    HStack{
                        
                        Text("Nouveautés")
                            //.font(.default)
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
                                }
                                .frame(width: 155, height: 173)
                                .cornerRadius(20)
                            }
                        }
                    }
                    
                }
                .frame(width: 360, height: 700)
                .glassCard(cornerRadius: 20, tintOpacity: 0.19, strokeOpacity: 0.25)
            }
        }
    }
}

#Preview {
    ShopView()
}
