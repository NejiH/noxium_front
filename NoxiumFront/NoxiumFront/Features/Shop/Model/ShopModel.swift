//
//  ShopModel.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import Foundation

@Observable
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
    
}

