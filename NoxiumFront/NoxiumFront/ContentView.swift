//
//  ContentView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 17/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProductView(shopItem: ShopItem(name: "blabla", image: "Perso3", price: 200, description: "onsenfout"), productViewModel: ProductViewModel())    }
}

#Preview {
    ContentView()
}
