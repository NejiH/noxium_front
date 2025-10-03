//
//  Service.example.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 24/09/2025.
//

import Foundation
import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let username: String
    let image: String
}

struct Scenario: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
}

struct User: Identifiable {
    let id: UUID
    let username: String
    let password: String
    let birthday: Date
    let profilPicture: String
    let ingameMoney: Int
    var experience: Float
    let likes: Int
    let dislikes: Int
    let sonor_effect: Bool
    let music: Bool
    let vibration: Bool
    let friends: [Friend]
    let scenarios: [Scenario]
}

final class ScenarioExampleService {
    static let shared = ScenarioExampleService()
    
    private init() {}
    
    func fetchScenario() -> Scenario {
        return Scenario(name: "Halloween", description: "Scenario d'Halloween", image: "scenarioHalloween")
    }
}

final class UserExampleService {
    static let shared = UserExampleService()
    
    private init() {}
    
    func fetchUser() -> User {
        return User(
            id: UUID(),
            username: "Arnaud",
            password: "coucou",
            birthday: Date(),
            profilPicture: "avatar-arnaud",
            ingameMoney: 100,
            experience: 86,
            likes: 100,
            dislikes: 0,
            sonor_effect: false,
            music: true,
            vibration: true,
            friends: [
                Friend(username: "Kim", image: "avatar-kim"),
                Friend(username: "Ernestio", image: "avatar-ernestin"),
                Friend(username: "Emma", image: "avatar-emma"),
                Friend(username: "Valentin", image: "avatar-valentin"),
                Friend(username: "Mounir", image: "avatar-mounir"),
                Friend(username: "Kim", image: "avatar-kim"),
                Friend(username: "Ernestio", image: "avatar-ernestin"),
                Friend(username: "Emma", image: "avatar-emma"),
                Friend(username: "Valentin", image: "avatar-valentin")
            ],
            scenarios: [
                Scenario(name: "Simplon", description: "Description scenario 2", image: "scenarioSimplon"),
                Scenario(name: "Halloween", description: "Description scenario 1", image: "scenarioHalloween"),
                Scenario(name: "Alice", description: "Description scenario 3", image: "scenarioAlice")
            ]
        )
    }
}



