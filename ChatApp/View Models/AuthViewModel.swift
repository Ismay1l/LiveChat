//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/20/24.
//

import Foundation
import Combine
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var isLoginMode = false {
        willSet {
            resetTextFields()
        }
    }
    
    @Published var emailText = "" {
        didSet {
            checkButtonEnable(emailText)
            loginStatusMessage = ""
            imageUploadStatusMessage = ""
        }
    }
    @Published var passwordText = "" {
        didSet {
            checkButtonEnable(emailText)
            loginStatusMessage = ""
            imageUploadStatusMessage = ""
        }
    }
    
    @Published var isDisabled: Bool = true
    @Published var loginStatusMessage = ""
    @Published var imageUploadStatusMessage = ""
    @Published var shouldShowImagePicker: Bool = false
    @Published var image: UIImage?
}

extension AuthViewModel {
    
    private func checkButtonEnable(_ email: String) {
        if validateEmail(email) && !passwordText.isEmpty && !emailText.isEmpty && passwordText.count >= 8 {
            isDisabled = false
        } else {
            isDisabled = true
        }
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailPattern =
        "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
        let regex = try! NSRegularExpression(pattern: emailPattern, options: [.caseInsensitive])
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
    }
    
    func resetTextFields() {
        emailText = ""
        passwordText = ""
        loginStatusMessage = ""
        imageUploadStatusMessage = ""
    }
    
    func buttonTapped() {
        if isLoginMode {
            FirebaseAuth.shared.login(emailText, password: passwordText) { [weak self] status in
                self?.loginStatusMessage = status
            }
        } else {
            FirebaseAuth.shared.createAccount(emailText, passwordText, image: image) { [weak self] status in
                self?.loginStatusMessage = status
            } imageHandler: { [weak self] status in
                self?.imageUploadStatusMessage = status
            }
        }
    }
}
