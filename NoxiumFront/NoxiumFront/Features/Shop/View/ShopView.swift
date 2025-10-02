//
//  ShopView.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopView: View {
    @State private var scenarioViewModel = ScenarioViewModel()

    
    var body: some View {
        
        NavigationStack{
            ZStack(alignment: .top) {
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
                        
                        MoneyComponentView()
                            .foregroundStyle(Color(.white))
                    }
                                            
                        VStack {
                            
                            ScrollView{
                                
                                ForEach(scenarioViewModel.scenarios){ scenario in
                                }
                                Spacer(minLength: 20)
                                
                                ShopScrollNews(viewModel: $scenarioViewModel)
                                Spacer(minLength: 20)
                                
                                ShopScrollPopular(viewModel: $scenarioViewModel)
                                Spacer(minLength: 20)
                                
                                ShopScrollUnlock(viewModel: $scenarioViewModel)
                                
                            }
                            .frame(width: 360, height: 636)
                            .glassCard()
                            .clipped()
                            
                        }
                        .scrollIndicators(.hidden)
                        
                    
                    TabBarView()
                    
                    
                }.padding(20)
                .padding(.top, 40)
                
                
            }
            
                }.onAppear{
                    scenarioViewModel.fetchScenarios(token:  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmF0aW9uIjoxNzU5OTk1NjQyLjMwOTc5MiwiaWQiOiJFQkU1RDAzQS00RTVBLTRDNzItQkIzMC04RkI5RTQxNTJEM0UifQ.lLCfXZfG7TwshoQPTebZLwNV9u1qFJx5lpgKGz8xX0c")
                }

            }
           
        }

  
#Preview {
    ShopView()
}
