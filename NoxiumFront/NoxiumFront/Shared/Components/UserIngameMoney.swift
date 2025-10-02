//
//  experience.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 30/09/2025.
//

import SwiftUI

struct UserIngameMoney: View {
    let viewModel = ProfileViewModel()
    
    var body: some View {
        HStack (spacing: 15){
            Image(viewModel.imageCoin)
                .resizable()
                .frame(width: 20, height: 20)
                
            
            Text("\(viewModel.user.ingameMoney)")
        }
        .frame(width: 107, height: 39)
        .background(.secondary)
        .clipShape(.capsule(style: .circular))
    }
}

#Preview {
    UserIngameMoney()
}
