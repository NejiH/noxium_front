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
    var user: User
    var backgroundImage = "background-profile"
    var userLevel = 0
    var font = "Musubi"
    var imageCoin = "coin"
    var toggleFriends: Bool = false
//
//    var totalXp: Float {
//        return 100
//    }
//    
//    var username: String {
//        return user.username
//    }
//    
    init() {
        self.user = User(id: UUID(), username: "", birthday: "", profilPicture: "", ingameMoney: 0, experience: 0, likes: 0, dislikes: 0, sonorEffect: false, music: false, vibration: false, scenarios: [])
    }
//    
//    func leveUp() {
//        if user.experience >= 100 {
//            userLevel += 1
//            user.experience = 0
//        }
//    }
//    
//    var friendToBubble: [Friend] {
//        toggleFriends ?  user.friends : Array(user.friends.prefix(5))
//    }
}
//
//
