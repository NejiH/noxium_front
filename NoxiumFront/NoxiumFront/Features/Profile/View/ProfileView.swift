////
////  ProfileView.swift
////  NoxiumFront
////
////  Created by Arnaud Hayon on 19/09/2025.
////
//
//import SwiftUI
//
////TODO: - les marges des boutons
//// les ronds qui sont ovales photo de profil ✅, trigger warnings et rond des amis > UPDATE DES EXPORTS
//// le scroll horizontal pour les scénarios qui ne prend pas toute la largeur à droite ✅
//// la police des titres ✅
//// le radius et le fond de la barre d'xp >
//// Changer les viewModel en viewModel.user 

import SwiftUI

//TODO: - les marges des boutons
// les ronds qui sont ovales photo de profil ✅, trigger warnings et rond des amis > UPDATE DES EXPORTS
// le scroll horizontal pour les scénarios qui ne prend pas toute la largeur à droite ✅
// la police des titres ✅
// le radius et le fond de la barre d'xp >
// Changer les viewModel en viewModel.user

struct ProfileView: View {
    
    @State private var viewModel = ProfileViewModel()
    
    
    
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
    
    var maskAvatar: some View {
        Image(.avatarLayer)
            .resizable()
            .frame(width: 145, height: 185)
    }
    
    var username: some View {
        Text(viewModel.user.username)
            .font(.custom(viewModel.font, size: 25))
            .fontWeight(.bold)
            .textCase(.uppercase)
    }
    
    var profileHeader: some View {
        VStack {
            username
            HStack (spacing: 20) {
                UserIngameMoney()
                UserExperience()
            }
            CustomProgressView(current:CGFloat(viewModel.user.experience), max: 100.00)
        }
    }
    
    var listScenario: some View {
        VStack (alignment: .leading){
            Text("Scenarios joués")
                .font(.title2)
                .fontWeight(Font.Weight.semibold)
            
            ScrollView (.horizontal) {
                HStack(spacing: 10) {
                    ForEach (viewModel.user.scenarios, id: \.id) { scenario in
                        
                        ScenarioCard(image: scenario.image, name: scenario.name)
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
            
            HStack {
                ScrollView(.vertical) {
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3),
                        spacing: 10
                    ) {
                        ForEach(viewModel.friendToBubble) { friend in
                            FriendBubble(image: friend.image, username: friend.username)
                        }
                        
                        Button {
                            viewModel.toggleFriends.toggle()
                        } label: {
                            viewModel.toggleFriends ?
                            FriendBubble(image: "background-button", username: "Voir Moins")
                                .animation(nil, value: UUID())
                            : FriendBubble(image: "background-button", username: "Voir tout")      .animation(nil, value: UUID())
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 20)
    }
    
    
    ///MainView
    var mainView: some View {
        ScrollView(.vertical) {
            VStack {
                avatar
                profileHeader
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

