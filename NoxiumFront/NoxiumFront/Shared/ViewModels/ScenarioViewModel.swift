//
//  ScenarioViewModel.swift
//  NoxiumFront
//
//  Created by Emma on 30/09/2025.
//


import Foundation
import Observation

@Observable
class ScenarioViewModel{
    var scenarios: [Scenario] = []
    
    func fetchScenarios(token: String){
        guard let url = URL(string: "http://localhost:8080/scenarios/all") else {
            print("mauvais url")
            return }
        
        
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do{
                    let decodedScenarios = try JSONDecoder().decode([Scenario].self, from: data)
                    DispatchQueue.main.async {
                        self.scenarios = decodedScenarios
                    }
                }
                catch {
                    print("Error decoding: \(error)")
                }
            }
            else if let error {
                print("Error: \(error)")
            }
        }
        .resume()
    }
}
