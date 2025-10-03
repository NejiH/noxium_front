//
//  User.swift
//  NoxiumFront
//
//  Created by Emma on 01/10/2025.
//
import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let username: String
    let birthday: String
    let profilPicture: String
    let ingameMoney: Int
    var experience: Int
    let likes: Int
    let dislikes: Int
    let sonorEffect: Bool
    let music: Bool
    let vibration: Bool
    let scenarios: [Scenario]
    
    enum CodingKeys: String, CodingKey {
            case id, username, birthday, profilPicture, ingameMoney, experience, likes, dislikes, sonorEffect, music, vibration, scenarios
        }
}

        
  
