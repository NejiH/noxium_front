//
//  ShopModel.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import Foundation

@Observable
class ShopCharacter: Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    
    init(name: String, image: String, price: Int, description: String) {
        self.name = name
        self.image = image
        self.price = price
        self.description = description
    }
    
}

