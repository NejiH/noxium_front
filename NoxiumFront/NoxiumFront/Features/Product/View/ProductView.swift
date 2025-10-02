//
//  ShopView.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ProductView: View {
    @State var shopItem: ShopItem
    @State var productViewModel: ProductViewModel
    
    var body: some View {
        ZStack(){
            
            Image(.backgroundShop)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .bottom)
            
                ScrollView (){
                    
                    ProductCard(shopItem: $shopItem)
                    
                    Button( action : {
                        // argent du user -= shopItem.price
                    }, label:{
                        
                        HStack{
                            Image("coin")
                            Spacer()
                            Text("\(shopItem.price)")
                                .fontWeight(.bold)
                            
                        }
                        .padding()
                        .frame(width: 100)
                        .background(.blue50)
                        .foregroundStyle(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius:40))
                        
                    })
                    
                    Spacer(minLength: 40)
                
                    
                    ShopCharacterScroll(shopCharacterViewModel: $productViewModel)
                    
                    Spacer(minLength: 40)
                    
                }
                .safeAreaInset(edge: .top) {
                    Spacer().frame(height: 80)
                }
                .scrollIndicators(.hidden)
            
        }
        .background(Color(.customPurple))

    }
}

#Preview {
    ProductView(shopItem: ShopItem(name: "blabla", image: "Perso3", price: 200, description: "onsenfout"), productViewModel: ProductViewModel())
}
