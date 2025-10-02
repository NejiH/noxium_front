//
//  ShopViewModel.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 29/09/2025.
//

import Foundation
import SwiftUI

@Observable
class ProductViewModel {
    var ShopCharacters: [ShopCharacter] = [
        ShopCharacter(name: "Valérie", image: "perso2", price: 100, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopCharacter(name: "Francis", image: "perso3", price: 150, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopCharacter(name: "Sofiane", image: "perso4", price: 50, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopCharacter(name: "Nicolas", image: "perso5", price: 200, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopCharacter(name: "Léa", image: "perso6", price: 120, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec."),
        ShopCharacter(name: "Arthur", image: "perso7", price: 80, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a commodo ligula. Duis commodo elit purus, et tincidunt tellus luctus nec.")
    ]
}
