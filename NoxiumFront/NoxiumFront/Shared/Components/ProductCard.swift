//
//  ProductCard.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 01/10/2025.
//

import SwiftUI

struct ProductCard: View {
    @Binding var shopItem : ShopItem

    var body: some View {
        if #available(iOS 26.0, *) {
            VStack(alignment: .leading){
                
                Spacer()
                
                Image(shopItem.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 299, height: 299)
                    .cornerRadius(30)
                    .padding(.horizontal, 25)
                
                Spacer()
                
                Text(shopItem.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                
                Spacer()
                
                Text(shopItem.description)
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .lineLimit(4)
                    .padding(.horizontal, 25)
                
                Spacer()
                
                
            }.frame(width: 353, height: 489)
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
            VStack(alignment: .leading){
                
                Spacer()
                
                Image(shopItem.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 299, height: 299)
                    .cornerRadius(30)
                    .padding(.horizontal, 25)
                
                Spacer()
                
                Text(shopItem.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                
                Spacer()
                
                Text(shopItem.description)
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .lineLimit(4)
                    .padding(.horizontal, 25)
                
                Spacer()
                
                
            }.frame(width: 353, height: 489)
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black.opacity(0.25), lineWidth: 1)
                )
                .clipped()
        }
    }
}

#Preview {
    ProductCard(shopItem: .constant(ShopItem(name: "Blabla", image: "perso2", price: 100, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec.")))
}
