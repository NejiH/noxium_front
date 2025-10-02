//
//  ShopView.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopView: View {
    @State var viewModel : ShopViewModel
    
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
                    
                    // Version 1 de la frame (si la personne a IOS26
                    if #available(iOS 26.0, *) {
                        
                        VStack {
                            
                            ScrollView{
                                
                                Spacer(minLength: 20)
                                
                                ShopScrollNews(viewModel: $viewModel)
                                Spacer(minLength: 20)
                                
                                ShopScrollPopular(viewModel: $viewModel)
                                Spacer(minLength: 20)
                                
                                ShopScrollUnlock(viewModel: $viewModel)
                                
                            }
                            .frame(width: 360, height: 636)
                            .glassEffect(
                                .clear
                                    .tint(.black.opacity(0.19)),
                                //                           -- .interactive(),-- mettre pour l'effet sur le clic
                                in: .rect(cornerRadius: 20)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
                            )
                            .clipped()
                            
                        }.scrollIndicators(.hidden)
                    } else {
                        
                        ScrollView{
                            VStack {
                                ShopScrollNews(viewModel: $viewModel)
                                
                                ShopScrollPopular(viewModel: $viewModel)
                                
                                ShopScrollUnlock(viewModel: $viewModel)
                                
                            }
                            .frame(width: 360, height: 800)
                            .background(.ultraThinMaterial)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
                            )
                        }.scrollIndicators(.hidden)
                    }
                    TabBarView()
                    
                    
                }.padding(20)
                    .padding(.top, 40)
                
                
            }
            
        }

    }
}

#Preview {
    ShopView(viewModel: ShopViewModel())
}
