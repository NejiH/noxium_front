//
//  UserViewModel.swift
//  NoxiumFront
//
//  Created by Emma on 01/10/2025.
//

import Foundation
import Observation

@Observable
class UserViewModel{
    var users: [User] = []
    
    func fetchUsers(token: String){
        guard let url = URL(string: "http://100.91.239.60:8080/users/All") else {
            print("mauvais url")
            return }
        
        
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                print("Raw JSON:", String(data: data, encoding: .utf8) ?? "nil")
                do{
                    let decoder = JSONDecoder()
                    let decodedUsers = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }
                }
                catch {
                    print("Error decoding: \(error)")
                }
            }
            else if let error {
                print("Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code:", httpResponse.statusCode)
            }
        }
        .resume()
    }
}
