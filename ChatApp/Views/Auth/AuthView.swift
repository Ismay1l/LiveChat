//
//  ContentView.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/20/24.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Picker("Picker", selection: $authViewModel.isLoginMode) {
                    Text("Login")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if authViewModel.isLoginMode {
                    LoginView(
                        emailText: $authViewModel.emailText,
                        passwordText: $authViewModel.passwordText,
                        isDisabled: $authViewModel.isDisabled,
                        statusMessage: $authViewModel.loginStatusMessage
                    ) {
                        authViewModel.buttonTapped()
                    }
                } else {
                    CreateAccountView(
                        emailText: $authViewModel.emailText,
                        passwordText: $authViewModel.passwordText,
                        isDisabled: $authViewModel.isDisabled,
                        statusMessage: $authViewModel.loginStatusMessage,
                        imageUploadStatusMessage: $authViewModel.imageUploadStatusMessage,
                        shouldShowImagePicker: $authViewModel.shouldShowImagePicker,
                        image: $authViewModel.image
                    ) {
                        authViewModel.buttonTapped()
                    }
                }
            }
            .background(Color(.init(white: 0.0, alpha: 0.05))
                .ignoresSafeArea())
            .navigationTitle(authViewModel.isLoginMode ? "Log in" : "Create Account")
            .fullScreenCover(isPresented: $authViewModel.shouldShowImagePicker) {
                ImagePicker(image: $authViewModel.image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
