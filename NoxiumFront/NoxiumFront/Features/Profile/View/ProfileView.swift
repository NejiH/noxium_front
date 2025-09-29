//
//  ProfileView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 19/09/2025.
//

import SwiftUI

//TODO: - les marges des boutons
// les ronds qui sont ovales photo de profil ✅, trigger warnings et rond des amis > UPDATE DES EXPORTS
// le scroll horizontal pour les scénarios qui ne prend pas toute la largeur à droite ✅
// la police des titres ✅
// le radius et le fond de la barre d'xp >
// Changer les viewModel en viewModel.user 

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
        Image(viewModel.user.profilPicture)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 140)
//            .clipShape(Circle())
            .mask(maskAvatar)
    }
    
    var username: some View {
        Text(viewModel.user.username)
            .font(.custom(viewModel.font, size: 25))
            .fontWeight(.bold)
            .textCase(.uppercase)
    }
    
    var maskAvatar: some View {
        Image(.avatarLayer)
            .resizable()
            .frame(width: 145, height: 185)
    }
    
    var ingameMoney: some View {
        HStack (spacing: 15){
            Image(viewModel.imageCoin)
                .resizable()
                .frame(width: 20, height: 20)
                
            
            Text("\(viewModel.ingameMoney)")
        }
        .frame(width: 107, height: 39)
        .background(.secondary)
        .clipShape(.capsule(style: .circular))
    }
    
    var userLevel: some View {
        Text("lvl \(viewModel.userLevel)")
            .frame(width: 82, height: 39)
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
                .progressViewStyle(ProfileViewModel.CustomProgressViewStyle(
                    backgroundColor: .gray.opacity(0.2),
                    foregroundColor: .pink50,
                    cornerRadius: 100
                ))
                .frame(height: 12)
                .scaleEffect(y:1.5)

            
            Text("\(viewModel.experience, format: .number.precision(.fractionLength(0)))/100 xp")
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
    
    var addXpButton: some View {
        Button(action: { viewModel.addXp()
        }) {
            Text("ADD XP")
        }
    }
    
    var listScenario: some View {
        VStack (alignment: .leading){
            Text("Scenarios")
                .font(.title2)
                .fontWeight(Font.Weight.semibold)
            
            ScrollView (.horizontal) {
                HStack(spacing: 10) {
                    ForEach (viewModel.scenarios, id: \.id) { scenario in
                        
                        ZStack {
                            Image(scenario.image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 30.00, style: .circular))
                                .shadow(radius: 5)
                            
                            
                            VStack {
                                Spacer()
                                Text(scenario.name)
                                    .font(.custom(viewModel.font, size: 25))
                                    .shadow(radius: 5)
                                    .textCase(.uppercase)
                                    .padding(.bottom, 15)
                            }
                        }
                        .frame(maxWidth: 156, maxHeight: 173)
                    }
                }
                .foregroundStyle(.blue50)
            }
            .scrollIndicators(.never)
        }
        .padding(.leading, 20)
    }
    
    var listFriend: some View {
        VStack(alignment: .leading) {
            Text("Amis")
                .font(.title2)
                .fontWeight(Font.Weight.semibold)
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
                        .frame(maxWidth: 100, maxHeight: 100)
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
