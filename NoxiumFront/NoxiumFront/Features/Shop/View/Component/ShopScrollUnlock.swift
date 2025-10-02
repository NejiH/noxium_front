//
//  ShopScrollUnlock.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopScrollUnlock: View {
    @Binding var viewModel: ScenarioViewModel
    
    var body: some View {
        
        HStack{
            
            Text("Débloquer")
            //                .font(.default)
                .bold()
                .foregroundStyle(Color(.white))
            
            Spacer()
        }.padding(.horizontal, 20)
        ScrollView(.horizontal){
            HStack{
                ForEach($viewModel.scenarios){ $item in
                    //carte des items
                    ShopItemCard(shopItem: $item)
                    
                }
            }.padding(.leading, 20)
        }.scrollIndicators(.hidden)
        
        
    }
}


#Preview {
    ShopScrollUnlock(viewModel: .constant(ScenarioViewModel()))
}
