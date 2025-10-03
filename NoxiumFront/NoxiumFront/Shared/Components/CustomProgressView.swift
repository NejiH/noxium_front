//
//  CustomProgressView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 30/09/2025.
//

import SwiftUI

struct CustomProgressView: View {
    let viewModel = ProfileViewModel()
    var current: CGFloat // vie actuelle
    var max: CGFloat   // vie max
    var experience: Int
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            ZStack(alignment: .leading) {
                
                // Fond
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.gray.opacity(0.2))
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.gray.opacity(0.2))
                    )
//
                // Barre de vie
                RoundedRectangle(cornerRadius: 50)
                    .fill(.pink50)
                    .frame(width: (Double(current) > max ? max : current / Double(max)) * 300)
            }
            .frame(height: 15)
            
            Text("\(experience)/100 xp")

        }
            .padding(.top, 20)
            .padding(.horizontal, 20)
        
    }
}

#Preview {
    CustomProgressView(current: 80.00, max: 100.00, experience: 82)
}
