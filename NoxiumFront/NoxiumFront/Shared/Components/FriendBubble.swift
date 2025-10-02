//
//  FriendBubble.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 30/09/2025.
//

import SwiftUI

struct FriendBubble: View {
    let viewModel = ProfileViewModel()
    let image: String
    let username: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            ZStack {
                Text(username)
                    .font(.custom(viewModel.font, size: 20))
                    .foregroundStyle(.black)
                    .padding(.top, 2)
                    .padding(.leading, 2)

                Text(username)
                    .font(.custom(viewModel.font, size: 20))
                    
            }
            
        }
        .foregroundStyle(.blue50)
    }
}

#Preview {
    let viewModel = ProfileViewModel()
    
    FriendBubble(image: viewModel.user.friends[0].image, username: viewModel.user.username)
    FriendBubble(image: "background-button", username: "voir plus")
}
