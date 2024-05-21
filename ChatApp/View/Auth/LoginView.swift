//
//  LoginView.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/20/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var emailText: String
    @Binding var passwordText: String
    @Binding var isDisabled: Bool
    @Binding var statusMessage: String
    
    var buttonTapped: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Group {
                TextField(text: $emailText) {
                    Text("Email")
                        .foregroundColor(.gray.opacity(0.5))
                }
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                
                SecureField(text: $passwordText) {
                    Text("Password")
                        .foregroundColor(.gray.opacity(0.5))
                }
            }
            .padding([.leading, .trailing], 12)
            .frame(height: 60)
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(12)
            
            Button(action: {
                buttonTapped()
            }, label: {
                Spacer()
                Text("Log in")
                    .foregroundColor(isDisabled ? .white.opacity(0.5) : .white)
                    .bold()
                Spacer()
            })
            .padding(.all, 20)
            .background(isDisabled ? .blue.opacity(0.5) : .blue)
            .cornerRadius(8)
            .disabled(isDisabled)
            
            Text(statusMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
        .padding([.leading, .trailing], 12)
    }
}
