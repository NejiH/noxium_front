//
//  LandingPageView.swift
//  NoxiumFront
//
//  Created by Emma on 29/09/2025.
//

import SwiftUI


struct LandingPageView: View {
    
//    @State private var userViewModel = UserViewModel()
    @State private var currentUserVM = CurrentUserViewModel()
    @Environment(LoginViewModel.self) private var loginViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(.backgroundShop)
                    .ignoresSafeArea()
                VStack{
                    
                    if let user = currentUserVM.user {
                        HStack {
                            MoneyComponentView(money: user.ingameMoney)
                            Spacer()
                            LevelComponentView(experience: user.experience)
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
                    }
                    
                    if let user = currentUserVM.user {
                        ForEach(user.scenarios){ scenario in
                            ScenarioCardLandingComponent(scenario: scenario)
                            
                        }
                                } else {
                                    Text("Chargement...")
                                }
                    
                    
                    ZStack{
//                        ScenarioCardLandingComponent()
//                        
//                            .offset(x: -50)
//                            .scaleEffect(0.96)
//                            .blur(radius: 2)
//                            .shadow(color: .black, radius: 10)
//                        ScenarioCardLandingComponent().offset(x: 50)
//                            .scaleEffect(0.96)
//                            .blur(radius: 2)
//                            .shadow(color: .black, radius: 10)
//                        ScenarioCardLandingComponent(opacity: 0.6)
//                            .shadow(color: .black, radius: 10)
                        
                    }
                    Spacer()
                    
                }
            }
            .foregroundStyle(.white)
        }
        .onAppear{
            currentUserVM.fetchCurrentUser()
        }
    }
}

#Preview {
    LandingPageView().environment(LoginViewModel())
}
