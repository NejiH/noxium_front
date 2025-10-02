//
//  ContentView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 17/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var authViewModel = LoginViewModel()
    var body: some View {
        
        if authViewModel.isAuthenticated {
            LandingPageView()
                .environment(authViewModel)
        } else {
            LoginView()
                .environment(authViewModel) 
        }
    }
    
}

#Preview {
    ContentView()
}
