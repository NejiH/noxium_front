//
//  ProfileView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 19/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    private let viewModel = ProfileViewModel()
    
    var body: some View {
        mainView
        
    }
    
    //MARK: -Composants
    var background: some View {
        Image(decorative: viewModel.backgroundImage)
            .resizable()
    }
    
    
    
    var avatar: some View {
        Image(viewModel.profilePicture)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 140)
            .clipShape(Circle())
            .mask(maskAvatar)
    }
    
    var username: some View {
        Text(viewModel.username)
            .font(.custom("Musubi", size: 25))
            .fontWeight(.bold)
    }
    
    var maskAvatar: some View {
        Image(.avatarLayer)
            .resizable()
            .frame(width: 140, height: 140)
    }
    
    var ingameMoney: some View {
        HStack (spacing: 10){
            Image("coin")
                .resizable()
                .frame(width: 20, height: 20)
                
            
            Text("\(viewModel.ingameMoney)")
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .background(.secondary)
        .clipShape(.capsule(style: .circular))
    }
    
    var userLevel: some View {
        Text("lvl \(viewModel.userLevel)")
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.secondary)
            .clipShape(.capsule(style: .circular))
    }
    
    var moneyAndLevelStack: some View {
        HStack (spacing: 20) {
            ingameMoney
            userLevel
        }
       
    }
       
    var progressBar: some View {
        
        VStack (alignment: .trailing){

            ProgressView(value: viewModel.experience, total: viewModel.totalXp)
            .accentColor(.pink50)
            .frame(width: 300)
            .scaleEffect(y:3)
            
            Text("\(viewModel.experience, format: .number.precision(.fractionLength(0)))/100 xp")
        }
        .padding(.top, 10)

    }
    
    
    
    var addXpButton: some View {
        Button(action: { viewModel.addXp()
        }) {
            Text("ADD XP")
        }
    }
    
    ///MainView
    var mainView: some View {
        VStack {
            avatar
            username
            moneyAndLevelStack
            progressBar
            addXpButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
    
     
    
    
}

#Preview {
    ProfileView()
}
