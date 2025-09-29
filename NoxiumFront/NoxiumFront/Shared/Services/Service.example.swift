//
//  Service.example.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 24/09/2025.
//

import Foundation

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

struct User {
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
                Friend(username: "Mounir", image: "avatar-mounir")
            ],
            scenarios: [
                Scenario(name: "Halloween", description: "Description scenario 1", image: "scenario-skeleton"),
                Scenario(name: "Simplon", description: "Description scenario 2", image: "scenario-witch"),
                Scenario(name: "Alice", description: "Description scenario 3", image: "scenario-dead")
            ]
        )
    }
}

class ShopItem: Identifiable {

    let id = UUID()
    var name: String
    var image: String
    var price: Int
    
    init(name: String, image: String, price: Int) {
        self.name = name
        self.image = image
        self.price = price
    }
    
//    init(name: String, image: String, price: Int) {
//        self.name = name
//        self.image = image
//        self.price = price
//    }
}

var ShopItems: [ShopItem] = [
    ShopItem(name: "Simplon", image: "Simplon", price: 100),
    ShopItem(name: "Montreuil", image: "Montreuil", price: 150),
    ShopItem(name: "Vieux-Port", image: "VieuxPort", price: 50)
]
