//
//  CurrentUserViewModel.swift
//  NoxiumFront
//
//  Created by Emma on 02/10/2025.
//

import Foundation
import Observation

@Observable
class CurrentUserViewModel {
    var token: String? {
        didSet {
            if let token {
                saveToken(token)
            } else {
                clearToken()
            }
        }
    }
    var user: User? = nil
    
    init() {
      self.token = loadToken()
        
    }
    
    func fetchCurrentUser() {
        guard let token else { return }
        guard let url = URL(string: "http://100.91.239.60:8080/users") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    let decodedUser = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        self.user = decodedUser
                    }
                } catch {
                    print("Erreur de décodage:", error)
                }
            } else if let error {
                print("Erreur réseau:", error)
            }
        }.resume()
    }
    
    private func saveToken(_ token: String) {
            UserDefaults.standard.set(token, forKey: "authToken")
        }
        
        private func loadToken() -> String? {
            UserDefaults.standard.string(forKey: "authToken")
        }
        
        private func clearToken() {
            UserDefaults.standard.removeObject(forKey: "authToken")
        }
}
