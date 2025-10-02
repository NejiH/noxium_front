//
//  ProductCard.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 01/10/2025.
//

import SwiftUI

struct ProductCard: View {
    @Binding var shopItem : Scenario
    
    var body: some View {
        VStack(alignment: .leading){
            
            Spacer()
            
            AsyncImage(url: URL(string: shopItem.picture)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 299, height: 299)
                    .cornerRadius(30)
                    .padding(.horizontal, 25)
            } placeholder: {
                ProgressView() // Spinner de chargement
            }
            
            
            Spacer()
            
            Text(shopItem.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Spacer()
            
            Text(shopItem.synopsis)
                .font(.system(size: 16, design: .default))
                .foregroundColor(.white)
                .lineLimit(4)
                .padding(.horizontal, 25)
            
            Spacer()
            
            
        }.frame(width: 353, height: 489)
            .glassCard()
            .clipped()
    }
}

#Preview {
    ProductCard(shopItem: .constant(Scenario(id: UUID(), name: "Billy", synopsis: "frefe", picture: "https://i.ibb.co/67h1vjXb/Chat-GPT-Image-2-oct-2025-16-25-31.png", minAge: 0, map: "")))
}
