//
//  AuthViewModel.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 18/09/2025.
//

import Foundation
import SwiftUI

@Observable
class AuthViewModel {
    
    
    //TODO: -RESET LES CHAMPS QUAND ON CHANGE DE PAGE
    
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var numberOfAccountCreated = 0
    let signInSubscribeButtonText = ["Sign in", "Subscribe"]
    var backgroundImage = "background-connexion"
    var connectionPage: Bool = false
    
    func accountCreatedCount() {
        numberOfAccountCreated += 1
        print(numberOfAccountCreated)
    }
    
    var buttonText: String {
        return connectionPage ? "Create one" : "Sign in" 
    }
    
    var changePageButtonText: String {
        return connectionPage ? "Sign in" : "Create account"
    }
    
    var buttonFirstText: String {
        return connectionPage ? "Don't have an account?" : "Already a member?" 
    }
    
    func isOnSubscribePage() {
        connectionPage = true
    }
    
    func isOnLogginPage() {
        connectionPage = false
    }

    func authPlaceholder(for fieldType: FieldType) -> String {
        return fieldType.placeholder
    }
    
    func handleSocialLogin(at index: Int) {
            switch index {
            case 0: print("Connexion via Google")
            case 1: print("Connexion via Apple")
            default: break
            }
        }
    
    struct SocialLogo {
        let imageName: String
        let serviceName: String
    }
    
    var socialLogos: [SocialLogo] = [
        SocialLogo(imageName: "logo-google", serviceName: "Google"),
        SocialLogo(imageName: "logo-apple", serviceName: "Apple")
    ]
}
