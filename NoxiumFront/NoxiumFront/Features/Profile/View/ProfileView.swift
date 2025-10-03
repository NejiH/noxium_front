//////
//////  ProfileView.swift
//////  NoxiumFront
//////
//////  Created by Arnaud Hayon on 19/09/2025.
//////
import SwiftUI

struct ProfileView: View {
    
    @State private var userViewModel = CurrentUserViewModel()
    @State private var profileViewModel = ProfileViewModel()
    @Environment(LoginViewModel.self) private var loginViewModel


    
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                if let user = userViewModel.user {
                    Image(user.profilPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                    //            .clipShape(Circle())
                        .mask(maskAvatar)
                    
                    Text(user.username)
                        .font(.custom("Musubi", size: 25))
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                    
                    HStack (spacing: 20) {
                        MoneyComponentView(money:user.ingameMoney)
                        LevelComponentView(experience: user.experience)
                    }
                    CustomProgressView(current:CGFloat(user.experience), max: 100.00, experience: user.experience)
                    
                    VStack (alignment: .leading){
                        Text("Scenarios joués")
                            .font(.title2)
                            .fontWeight(Font.Weight.semibold)
                        
                        ScrollView (.horizontal) {
                            HStack(spacing: 10) {
                                ForEach (user.scenarios, id: \.id) { scenario in
                                    
                                    ScenarioCard(image: scenario.picture, name: scenario.name)
                                }
                            }
                            .foregroundStyle(.blue50)
                        }
                        .scrollIndicators(.never)
                    }
                    .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Amis")
                            .font(.title2)
                            .fontWeight(Font.Weight.semibold)
                            .padding(.top, 20)
                        
//                        HStack {
//                            ScrollView(.vertical) {
//                                LazyVGrid(
//                                    columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3),
//                                    spacing: 10
//                                ) {
//                                    ForEach(profileViewModel.friendToBubble) { friend in
//                                        FriendBubble(image: friend.image, username: friend.username)
//                                    }
//                                    
//                                    Button {
//                                        viewModel.toggleFriends.toggle()
//                                    } label: {
//                                        viewModel.toggleFriends ?
//                                        FriendBubble(image: "background-button", username: "Voir Moins")
//                                            .animation(nil, value: UUID())
//                                        : FriendBubble(image: "background-button", username: "Voir tout")      .animation(nil, value: UUID())
//                                    }
//                                }
//                            }
//                            .frame(maxWidth: .infinity)
//                        }
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 60)
        }
        .background(background)
        .foregroundColor(.white)
        .ignoresSafeArea()
        .onAppear{
            userViewModel.fetchCurrentUser()
        }
        
    }
    
    //MARK: -Composants
    var background: some View {
        Image(decorative: "background-profile")
            .resizable()
    }
    
    var maskAvatar: some View {
        Image(.avatarLayer)
            .resizable()
            .frame(width: 145, height: 185)
    }
    
//    var avatar: some View {
//        if let user = viewModel.user {
//            Image(viewModel.user?.profilPicture) // AJOUTER UN AVATAR PAR DEFAUT
//                .resizable()
//                .scaledToFill()
//                .frame(width: 140, height: 140)
//            //            .clipShape(Circle())
//                .mask(maskAvatar)
//        }
//    }
    
    
    
//    var username: some View {
//        Text(viewModel.user?.username)
//            .font(.custom(viewModel.font, size: 25))
//            .fontWeight(.bold)
//            .textCase(.uppercase)
//    }
    
//    var profileHeader: some View {
//        VStack {
//            username
//            HStack (spacing: 20) {
//                UserIngameMoney()
//                UserExperience()
//            }
//            CustomProgressView(current:CGFloat(viewModel.user.experience), max: 100.00)
//        }
//    }
    
//    var listScenario: some View {
//        VStack (alignment: .leading){
//            Text("Scenarios joués")
//                .font(.title2)
//                .fontWeight(Font.Weight.semibold)
//            
//            ScrollView (.horizontal) {
//                HStack(spacing: 10) {
//                    ForEach (viewModel.user.scenarios, id: \.id) { scenario in
//                        
//                        ScenarioCard(image: scenario.image, name: scenario.name)
//                    }
//                }
//                .foregroundStyle(.blue50)
//            }
//            .scrollIndicators(.never)
//        }
//        .padding(.leading, 20)
//    }
    
//    var listFriend: some View {
//        VStack(alignment: .leading) {
//            Text("Amis")
//                .font(.title2)
//                .fontWeight(Font.Weight.semibold)
//                .padding(.top, 20)
//            
//            HStack {
//                ScrollView(.vertical) {
//                    LazyVGrid(
//                        columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3),
//                        spacing: 10
//                    ) {
//                        ForEach(viewModel.friendToBubble) { friend in
//                            FriendBubble(image: friend.image, username: friend.username)
//                        }
//                        
//                        Button {
//                            viewModel.toggleFriends.toggle()
//                        } label: {
//                            viewModel.toggleFriends ?
//                            FriendBubble(image: "background-button", username: "Voir Moins")
//                                .animation(nil, value: UUID())
//                            : FriendBubble(image: "background-button", username: "Voir tout")      .animation(nil, value: UUID())
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity)
//            }
//        }
//        .padding(.horizontal, 20)
//    }
    
    
    ///MainView
//    var mainView: some View {
//        ScrollView(.vertical) {
//            VStack {
//                avatar
//                profileHeader
//                listScenario
//                listFriend
//            }
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 60)
//        }
//        .background(background)
//        .foregroundColor(.white)
//        .ignoresSafeArea()
//    }
}




#Preview {
    ProfileView().environment(LoginViewModel())
}

