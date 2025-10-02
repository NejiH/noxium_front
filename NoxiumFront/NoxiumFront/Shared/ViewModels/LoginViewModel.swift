//
//  LoginViewModel.swift
//  NoxiumFront
//
//  Created by Emma on 02/10/2025.
//

import Foundation
import Observation
import KeychainAccess

@Observable
class LoginViewModel {
    private let keychain = Keychain(service: "com.noxium.app")
    var token: String? {
        didSet {
                    if let token = token {
                        try? keychain.set(token, key: "authToken")
                    } else {
                        try? keychain.remove("authToken")
                    }
                }
    }
    
    var currentUser: User? {
            didSet {
                if let encoded = try? JSONEncoder().encode(currentUser) {
                    try? keychain.set(encoded, key: "currentUser")
                } else {
                    try? keychain.remove("currentUser")
                }
            }
        }
    
    var errorMessage: String? = nil
    var isAuthenticated: Bool {
            return token != nil && currentUser != nil
        }
    
    
    init() {
           
            token = try? keychain.get("authToken") ?? nil
            
            if let data = try? keychain.getData("currentUser"),
               let user = try? JSONDecoder().decode(User.self, from: data) {
                currentUser = user
            }
        }
    
    
    func login(username: String, password: String) {
        guard let url = URL(string: "http://100.91.239.60:8080/users/login") else {
            print("Mauvais URL")
            return
        }
        
        //créer le json  à envoyer
        let body: [String: String] = [
            "username": username,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //pas besoin d'authentification dans cette route
        
        do {
            //envoie le json
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            print("Erreur encodage body: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    //decode la réponse de la route
                    let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.token = decoded.token
                        self.currentUser = decoded.user
                        self.errorMessage = nil
                        
                        //sauvegarde le token
                        UserDefaults.standard.set(decoded.token, forKey: "authToken")
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "identifiant ou mot de passe incorrect"
                    }
                }
            } else if let error {
                DispatchQueue.main.async {
                    self.errorMessage = "Erreur réseau: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func logout() {
            token = nil
            currentUser = nil
        }
}
