//
//  CreateAccountView.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/20/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Binding var emailText: String
    @Binding var passwordText: String
    @Binding var isDisabled: Bool
    @Binding var statusMessage: String
    @Binding var imageUploadStatusMessage: String
    @Binding var shouldShowImagePicker: Bool
    @Binding var image: UIImage?
    
    var buttonTapped: () -> Void
    private let imageSize: (width: CGFloat, height: CGFloat) = (width: 120, height: 120)
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                VStack {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: imageSize.width, height: imageSize.height)
                            .scaledToFill()
                            .cornerRadius(imageSize.width / 2)
                    } else {
                        Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                            .customForegroundColor()
                    }
                }
                .overlay( RoundedRectangle(cornerRadius: imageSize.width / 2)
                    .stroke(.black, lineWidth: 3))
            }
            
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
            
            Text(imageUploadStatusMessage)
                .foregroundColor(.red)
        }
        .padding([.leading, .trailing], 12)
    }
}
