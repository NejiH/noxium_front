//
//  ProfileViewModel.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 22/09/2025.
//

import Foundation
import SwiftUI

@Observable

// TODO: -retirer le max de variable pour simplifier le code

class ProfileViewModel {
    let service = UserExampleService.shared
    var user: User
    var backgroundImage = "background-profile"
    var userLevel = 0
    var font = "Musubi"
    var imageCoin = "coin"
    var toggleFriends: Bool = false

    var totalXp: Float {
        return 100
    }
    
    var username: String {
        return user.username
    }
    
    init() {
        self.user = service.fetchUser()
    }
    
    func leveUp() {
        if user.experience >= 100 {
            userLevel += 1
            user.experience = 0
        }
    }
    
    var friendToBubble: [Friend] {
        toggleFriends ?  user.friends : Array(user.friends.prefix(5))
    }
}

