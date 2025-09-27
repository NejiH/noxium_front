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
            .font(.custom(viewModel.font, size: 25))
            .fontWeight(.bold)
    }
    
    var maskAvatar: some View {
        Image(.avatarLayer)
            .resizable()
            .frame(width: 140, height: 140)
    }
    
    var ingameMoney: some View {
        HStack (spacing: 10){
            Image(viewModel.imageCoin)
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
    
    //TODO: -AJOUTER LE TEXTE PAR DESSUS CHAQUE IMAGE
    var listScenario: some View {
        VStack (alignment: .leading){
            Text("Scenarios")
                .font(.title2)
                
            ScrollView (.horizontal) {
                HStack(spacing: 10) {
                    ForEach (viewModel.scenarios, id: \.id) { scenario in
                        
                        ZStack {
                            Image(scenario.image)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 20.00, style: .circular))
                                .shadow(radius: 5)
                            
                            Text(scenario.name)
                                .padding(.top, 100)
                                .font(.custom(viewModel.font, size: 25))
                                .shadow(radius: 5)
                        }
                        .frame(width: 160, height: 160)
                    }
                }
                .foregroundStyle(.blue50)
            }
            .scrollIndicators(.never)
        }
        .padding(.horizontal, 20)
    }
    
    var listFriend: some View {
        VStack(alignment: .leading) {
            Text("Amis")
                .font(.title2)
                .padding(.top, 20)
            
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3),
                    spacing: 0
                ) {
                    ForEach(viewModel.friends, id: \.id) { friend in
                        ZStack {
                            Image(friend.image)
                                .resizable()
                                .shadow(radius: 5)
                            
                            Text(friend.username)
                                .font(.custom(viewModel.font, size: 20))
                                .shadow(radius: 5)
                        }
                        .frame(width: 100, height: 100)
                    }
                    .foregroundStyle(.blue50)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
    
    ///MainView
    var mainView: some View {
        ScrollView(.vertical) {
            VStack {
                avatar
                username
                moneyAndLevelStack
                progressBar
                addXpButton
                listScenario
                listFriend
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 60)
        }
        .background(background)
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
