//
//  Scenario.swift
//  NoxiumFront
//
//  Created by Emma on 30/09/2025.
//

import Foundation
struct Scenario: Codable, Identifiable{
    let id: UUID
    let name: String
    let synopsis: String
    let picture: String
    let minAge: Int
    let map: String
   // let price: Int
}
