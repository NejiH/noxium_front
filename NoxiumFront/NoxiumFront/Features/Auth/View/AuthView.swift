//
//  AuthView.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 18/09/2025.
//

import SwiftUI

struct AuthView: View {
    
    @State private var viewModel = AuthViewModel()
    
    //MARK: -MAIN VIEW
    var body: some View {
        if viewModel.connectionPage {
            LoginView
        } else {
            SubscribeView
        }
    }
    
    ///Composants de la vue
    var background: some View {
        Image(decorative: viewModel.backgroundImage)
            .resizable()
    }
    
    //MARK: -Gros bouton rose
    var subscribeButton: some View {
        Button(action: {
            viewModel.accountCreatedCount()
        }) {
            HStack {
                Text(viewModel.changePageButtonText)
            }
        }
        .padding()
        .frame(width: 200, height: 70)
        .font(.system(size: 23))
        .background(Color(.pink50))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .padding(.top, 15)
    }
    
    var whiteLine: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: 100, height: 1)
            .accessibilityHidden(true)
    }
    
    var textOr: some View {
        Text("Or")
            .font(.system(size:28))
            .bold()
            .foregroundStyle(Color(.pink50))
    }
    
    var orSection: some View {
        HStack {
            whiteLine
            textOr
            whiteLine
        }
    }
    
    var socialButton: some View {
        HStack(spacing: 30) {
            ForEach(0..<viewModel.socialLogos.count, id: \.self) { index in
                let logo = viewModel.socialLogos[index]
                
                Button {
                    viewModel.handleSocialLogin(at: index)
                } label: {
                    Image(logo.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding()
                        .cornerRadius(10)
                        .accessibilityLabel("Bouton de connexion avec \(logo.serviceName)")
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
    }
    
    //MARK: -Bouton SignIn / Create an account dans le texte en bas
    var signInText: some View {
        HStack {
            Text(viewModel.buttonFirstText)
                .foregroundStyle(.white)
            Button(action: {
                if viewModel.connectionPage {
                    viewModel.isOnLogginPage()
                } else {
                    viewModel.isOnSubscribePage()
                }
            }) {
                HStack {
                    Text(viewModel.buttonText)
                        .foregroundStyle(.cyan)
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
        .bold()
    }
    
    //MARK: -LOGIN VIEW
    var LoginView: some View {
        VStack {
            Spacer()
            GenericTextField(viewModel: viewModel, fieldType: .username)
            GenericTextField(viewModel: viewModel, fieldType: .password)
            Spacer()
                .frame(maxHeight: 150)
            subscribeButton
            orSection
            socialButton
            signInText
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
        .ignoresSafeArea()
    }
    
    //MARK: -SUBSCRIBE VIEW
    var SubscribeView: some View {
        VStack {
            Spacer()
            GenericTextField(viewModel: viewModel, fieldType: .username)
            GenericTextField(viewModel: viewModel, fieldType: .email)
            GenericTextField(viewModel: viewModel, fieldType: .password)
            GenericTextField(viewModel: viewModel, fieldType: .confirmPassword)
            Spacer()
            subscribeButton
            orSection
            socialButton
            signInText
                .padding(.bottom, 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
        .ignoresSafeArea()
    }
    
}

//MARK: -Code pour générer un TextField avec des placeholder dynamiques
struct GenericTextField: View {
    @Bindable var viewModel: AuthViewModel
    let fieldType: FieldType
    
    var text: Binding<String> {
        switch fieldType {
        case .username:
            return $viewModel.username
        case .email:
            return $viewModel.email
        case .password:
            return $viewModel.password
        case .confirmPassword:
            return $viewModel.confirmPassword
        }
    }
    
    var body: some View {
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(fieldType.placeholder)
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                }
                
                Group {
                    if fieldType.isSecure {
                        SecureField("", text: text)
                            .foregroundColor(.white)
                    } else {
                        TextField("", text: text)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 15)
            }
            .frame(width: 303, height: 65)
            .font(.system(size:23))
            .background(.secondary)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color(.pink50), lineWidth: 1)
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(7)
        }
}


#Preview {
    AuthView()
}
