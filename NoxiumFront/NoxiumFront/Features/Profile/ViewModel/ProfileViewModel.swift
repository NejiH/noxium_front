////
////  ProfileViewModel.swift
////  NoxiumFront
////
////  Created by Arnaud Hayon on 22/09/2025.
////
//
import Foundation
import SwiftUI
//
////@Observable
//
//// TODO: -retirer le max de variable pour simplifier le code
//
//
class ProfileViewModel {
//    let service = UserExampleService.shared
    @State private var userViewModel = UserViewModel()
    @State private var currentUserVM = CurrentUserViewModel()
    
    var backgroundImage = "background-profile"
    var userLevel = 0
    var font = "Musubi"
    var toggleFriends: Bool = false

    var totalXp: Int = 100

    
    
//    MARK: -EN ATTENTE DE LA ROUTE POST POUR FAIRE DES MODIFS DIRECT SUR LE SERVEUR 
//    func leveUp() {
//        if let user = currentUserVM.user{
//            if user.experience >= 100 {
//                userLevel += 1
//                user.experience = 0
//            }
//        }
//    }

    //MARK: -A REACTIVER QUAND ON AURA DES AMIS DANS LE USER
//    var friendToBubble: [Friend] {
//        toggleFriends ?  currentUserVM.user.friends : Array(currentUserVM.user.friends.prefix(5))
//    }
}
//
//
