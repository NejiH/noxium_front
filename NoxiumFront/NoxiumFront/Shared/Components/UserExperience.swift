//
//  experience.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 30/09/2025.
//

import SwiftUI

struct UserExperience: View {
    let viewModel = ProfileViewModel()
    
    var body: some View {
        
    
            Text("lvl \(viewModel.userLevel)")
                .frame(width: 82, height: 39)
                .background(.secondary)
                .clipShape(.capsule(style: .circular))
        
    }
}

#Preview {
        UserExperience()
    
}
