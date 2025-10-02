//
//  TabBarView.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 30/09/2025.
//

import SwiftUI

struct TabBarView: View {
    
    @State var pageForTabBar: Tab = .profil
    
    var body: some View {
        if #available(iOS 26.0, *) {
            HStack {
                ZStack{
                    
                    Rectangle()
                        .frame(
                                width: pageForTabBar == .jouer ? 75 :
                                       pageForTabBar == .mesParties ? 125 :
                                       pageForTabBar == .shop ? 80 : 70,
                                height: 55
                            )
                            .foregroundStyle(Color(.pink50))
                            .cornerRadius(50)
                            .offset(
                                x: pageForTabBar == .jouer ? -140 :
                                   pageForTabBar == .mesParties ? -35 :
                                   pageForTabBar == .shop ? 65 : 140,
                                y: 0
                            )
                            .animation(.easeInOut(duration: 0.3), value: pageForTabBar)
                    
                    HStack{
                        
                        Button(action: {
                            pageForTabBar = .jouer
                        }, label : {
                            
                            
                            VStack{
                                
                                Image(.puzzle)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Jouer")
                                    .foregroundStyle(Color(.white))
                            }.padding(.leading, 15)
                            
                        })
                        
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .mesParties
                        }, label : {
                            
                            VStack{
                                Image(.playCircle)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Mes parties")
                                    .foregroundStyle(Color(.white))
                            }
                        })
                        
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .shop
                        }, label : {
                            
                            VStack{
                                Image(.shoppingCart)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Shop")
                                    .foregroundStyle(Color(.white))
                            }
                        })
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .profil
                        }, label : {
                            VStack{
                                Image(.user)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Profil")
                                    .foregroundStyle(Color(.white))
                            }.padding(.trailing, 15)
                            
                        })
                        
                        
                    }
                }
                .frame(width: 356, height: 62)
                
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
                
            }
        } else {
            HStack {
                ZStack{
                    
                    Rectangle()
                        .frame(
                                width: pageForTabBar == .jouer ? 75 :
                                       pageForTabBar == .mesParties ? 125 :
                                       pageForTabBar == .shop ? 80 : 70,
                                height: 55
                            )
                            .foregroundStyle(Color(.pink50))
                            .cornerRadius(50)
                            .offset(
                                x: pageForTabBar == .jouer ? -140 :
                                   pageForTabBar == .mesParties ? -35 :
                                   pageForTabBar == .shop ? 65 : 140,
                                y: 0
                            )
                            .animation(.easeInOut(duration: 0.3), value: pageForTabBar)
                    
                    HStack{
                        
                        Button(action: {
                            pageForTabBar = .jouer
                        }, label : {
                            
                            
                            VStack{
                                
                                Image(.puzzle)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Jouer")
                                    .foregroundStyle(Color(.white))
                            }.padding(.leading, 15)
                            
                        })
                        
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .mesParties
                        }, label : {
                            
                            VStack{
                                Image(.playCircle)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Mes parties")
                                    .foregroundStyle(Color(.white))
                            }
                        })
                        
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .shop
                        }, label : {
                            
                            VStack{
                                Image(.shoppingCart)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                
                                Text("Shop")
                                    .foregroundStyle(Color(.white))
                            }
                        })
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            pageForTabBar = .profil
                        }, label : {
                            VStack{
                                Image(.user)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Profil")
                                    .foregroundStyle(Color(.white))
                            }.padding(.trailing, 15)
                            
                        })
                        
                        
                    }
                }
                .frame(width: 356, height: 62)
                
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black.opacity(0.25), lineWidth: 1)
                )
                
            }
        }    }
}

#Preview {
    TabBarView()
}
