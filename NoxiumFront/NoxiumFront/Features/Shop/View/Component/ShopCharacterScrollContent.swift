//
//  ShopCharacterScrollContent.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 01/10/2025.
//

import SwiftUI

struct ShopCharacterScrollContent: View {
    @Binding var selectedCharacter: ShopCharacter
    @Binding var shopCharacterViewModel: ProductViewModel
    
    var body: some View {
        VStack(alignment : .leading){
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 8) {
                        ForEach(shopCharacterViewModel.ShopCharacters) { character in
                            Button {
                                withAnimation {
                                    selectedCharacter = character
                                    proxy.scrollTo(character.id, anchor: .center)
                                    
                                }
                            } label: {
                                Image("\(character.image)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 124, height: 180)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                selectedCharacter.id == character.id ? Color.pink50 : Color.clear,
                                                lineWidth: 5
                                            )
                                    )
                                
                            }
                            
                            .id(character.id)
                        }
                    }
                    .padding(10)
                }
                .scrollIndicators(.hidden)
            }
            
            Text(selectedCharacter.name)
                .foregroundStyle(Color.white)
                .font(Font.largeTitle.bold())
                .padding(.horizontal, 20)
            
            Spacer()
            
            Text(selectedCharacter.description)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
        }
    }
}

#Preview {
    ShopCharacterScrollContent(selectedCharacter: .constant(ShopCharacter(name: "", image: "", price: 4, description: "")) ,shopCharacterViewModel: .constant(ProductViewModel()))
}
