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
        ShopItem(name: "Simplon", image: "Simplon", price: 100, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec." ),
        ShopItem(name: "Montreuil", image: "Montreuil", price: 150, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopItem(name: "Vieux-Port", image: "VieuxPort", price: 50, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec.")
    ]
}
