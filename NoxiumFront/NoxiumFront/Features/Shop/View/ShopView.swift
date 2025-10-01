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
                }.padding(.leading, 20)
                
                // Version 1 de la frame (si la personne a IOS26
                if #available(iOS 26.0, *) {
                    VStack {
                        Spacer(minLength: 20)

                        ShopScrollNews(viewModel: $viewModel)
                        Spacer(minLength: 20)
                        
                        ShopScrollPopular(viewModel: $viewModel)
                        Spacer(minLength: 20)

                        ShopScrollUnlock(viewModel: $viewModel)

                    }
                    .frame(width: 360, height: 600)
                    .padding(.top, 30)
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
                } else {
                    VStack {
                        ShopScrollNews(viewModel: $viewModel)
                        
                        ShopScrollPopular(viewModel: $viewModel)
                        
                        ShopScrollUnlock(viewModel: $viewModel)

                    }
                    .frame(width: 360, height: 700)
                    .padding(.top, 30)
                    .background(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.25), lineWidth: 1)
                    )

                }
                //.frame(width: 360, height: 700)
                //.glassCard(cornerRadius: 20, tintOpacity: 0.19, strokeOpacity: 0.25)
            }
        }
    }
}

#Preview {
    ShopView(viewModel: ShopViewModel())
}
