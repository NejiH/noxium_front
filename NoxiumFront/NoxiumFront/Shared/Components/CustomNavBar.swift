//
//  CustomNavBar.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 01/10/2025.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image("settings")
                .resizable()
                .frame(width:75, height: 75)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomNavBar()
}
