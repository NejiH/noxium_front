//
//  ShopScrollNews.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopScrollNews: View {
    
    @Binding var viewModel: ShopViewModel

    var body: some View {
        
        HStack{
            
            Text("Nouveautés")
                .bold()
                .foregroundStyle(Color(.white))
            
            Spacer()
        }.padding(.horizontal, 20)
        ScrollView(.horizontal){
            HStack{
                ForEach($viewModel.ShopItems){ $item in
                    //carte des items
                    ShopItemCard(shopItem: $item)
                    
                }
            }.padding(.leading, 20)
        }.scrollIndicators(.hidden)
        
        
            }
}

#Preview {
    ShopScrollNews(viewModel: .constant(ShopViewModel()))
}
