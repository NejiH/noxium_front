//
//  LandingPageView.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI


struct LandingPageView: View {
    
    @State private var userViewModel = UserViewModel()
    var body: some View {
        NavigationStack{
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
                            .glassCard(cornerRadius: 30, tintOpacity: 0.19, strokeOpacity: 0.25, interactive: true)
                        })
                        
                    }
                    .padding()
                    .padding(.vertical, 40)
                    
                    if userViewModel.users.isEmpty {
                        Text("Aucun utilisateur disponible")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                    } else {
                        List(userViewModel.users){ user in
                            Text(user.username)
                                .foregroundStyle(.black)
                        }
                    }
                    
                    ZStack{
                        ScenarioCardLandingComponent()
                        
                            .offset(x: -50)
                            .scaleEffect(0.96)
                            .blur(radius: 2)
                            .shadow(color: .black, radius: 10)
                        ScenarioCardLandingComponent().offset(x: 50)
                            .scaleEffect(0.96)
                            .blur(radius: 2)
                            .shadow(color: .black, radius: 10)
                        ScenarioCardLandingComponent(opacity: 0.6)
                            .shadow(color: .black, radius: 10)
                        
                    }
                    Spacer()
                    
                }
            }
            .foregroundStyle(.white)
        }
        .onAppear{
            userViewModel.fetchUsers(token:  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjREODQ4NTcwLUEyMkMtNDA3Mi1BRkQxLTZCQzYwOEUwREJCRiIsImV4cGlyYXRpb24iOjE3NTkzMjgyMDYuODk0Nzc4fQ.D5ikyS5J7wQEnA4V9a0OAW4e6BIzaiOBrurxxzM-mKs")
        }
    }
}

#Preview {
    LandingPageView()
}
