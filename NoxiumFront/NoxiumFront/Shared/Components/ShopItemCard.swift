//
//  ShopItemCard.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import SwiftUI

struct ShopItemCard: View {
    
    @Binding var shopItem : ShopItem
    
    var body: some View {
        NavigationLink {
            ProductView(shopItem: shopItem, productViewModel: ProductViewModel())
        } label: {
            ZStack {
                // Image de fond
                Image(shopItem.image)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                // Titre de la carte
                VStack{
                    //Composant argent
                    HStack{
                        Spacer()
                        if #available(iOS 26.0, *) {
                            HStack{
                                Image("coin")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("\(shopItem.price)")
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 72, height: 25)
                            .padding(.horizontal, 5)
                            .glassEffect(
                                .clear
                                    .tint(.pink50.opacity(0.19)) // teinte très subtile pour maximiser la transparence
                                    .interactive(),
                                in: .rect(cornerRadius: 30)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
                            )
                        } else {
                            HStack{
                                Image("coin")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("\(shopItem.price)")
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 72, height: 25)
                            .padding(.horizontal, 5)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
                            )
                        }
                    }
                    
                    Spacer()
                    
                    Text(shopItem.name.uppercased())
                        .font(.custom("Musubi", size: 22))
                        .foregroundStyle(.blue50)
                    
                }.padding()
            }.frame(width: 155, height: 173)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 20, x: 10, y: 10)
        }
    }
}

#Preview {
    ShopItemCard(shopItem: .constant(ShopItem(name: "Blabla", image: "perso2", price: 100, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec.")))
}
