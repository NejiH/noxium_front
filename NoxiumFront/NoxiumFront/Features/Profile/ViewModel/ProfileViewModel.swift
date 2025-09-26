//
//  ProfileViewModel.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 22/09/2025.
//

import Foundation

@Observable
class ProfileViewModel {
    let service = UserExampleService.shared
    var user: User
    var backgroundImage = "background-profile"
    var userLevel = 0
    var experience: Float {
        user.experience
    }
    
    var ingameMoney: Int {
        user.ingameMoney
    }
    var friends: [Friend] {
        user.friends
    }
    var scenarios: [Scenario] {
        user.scenarios
    }
    var totalXp: Float {
        return 100
    }
    
    init() {
        self.user = service.fetchUser()
    }
    
    var profilePicture: String {
        return user.profilPicture
    }
    
    var username: String {
        return user.username
    }
    
    func leveUp() {
        if experience >= 100 {
            userLevel += 1
            user.experience = 0
        }
    }
    
    func addXp() {
        user.experience += 10
        if user.experience >= 100 {
            userLevel += 1
            user.experience = 0
        }
    }
    
}
