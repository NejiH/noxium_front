//
//  ShopViewModel.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import Foundation
import SwiftUI

@Observable
class ShopViewModel {
    var ShopItems: [ShopItem] = [
        ShopItem(name: "Simplon", image: "Simplon", price: 100),
        ShopItem(name: "Montreuil", image: "Montreuil", price: 150),
        ShopItem(name: "Vieux-Port", image: "VieuxPort", price: 50)
    ]
}
