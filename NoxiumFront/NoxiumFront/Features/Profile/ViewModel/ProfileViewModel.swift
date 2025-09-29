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
    
//    var profilePicture: String {
//        return user.profilPicture
//    }
    
    var username: String {
        return user.username
    }
    
    init() {
        self.user = service.fetchUser()
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
    
    struct CustomProgressViewStyle: ProgressViewStyle {
        var backgroundColor: Color
        var foregroundColor: Color
        var cornerRadius: CGFloat

        func makeBody(configuration: Configuration) -> some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Fond arrondi
                    Rectangle()
                        .fill(backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .circular))

                    // Barre de progression arrondie
                    Rectangle()
                        .fill(foregroundColor)
                        .frame(width: max(0, geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0)))
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .circular))
                }
            }
            .frame(height: 12)
        }
    }
}
