//
//  LoginView.swift
//  NoxiumFront
//
//  Created by Emma on 02/10/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(LoginViewModel.self) private var loginViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Nom d'utilisateur", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Mot de passe", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Se connecter") {
                loginViewModel.login(username: username, password: password)
            }
            .padding()
            
            if let user = loginViewModel.currentUser {
                Text("Connecté en tant que \(user.username)")
                    .foregroundColor(.green)
            }
            
            if let error = loginViewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }
        }
        .padding()
    }
}
