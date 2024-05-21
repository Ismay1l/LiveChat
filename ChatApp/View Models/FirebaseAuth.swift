//
//  FirebaseAuth.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/21/24.
//

import Foundation
import Firebase
import UIKit

class FirebaseAuth {
    static let shared = FirebaseAuth()
    private init() {}
    
    func createAccount(_ email: String, _ password: String, image: UIImage?, handler: @escaping (String) -> Void, imageHandler: @escaping (String) -> Void) {
        FirebaseManager.shared.auth.createUser(
            withEmail: email,
            password: password
        ) { [weak self] result, error in
            if error != nil {
                handler(String(describing: error))
                return
            }
            handler(String(describing: result))
            self?.uploadImage(image) { message in
                imageHandler(message)
            }
        }
    }
    
    func login(_ email: String, password: String, handler: @escaping (String) -> Void) {
        FirebaseManager.shared.auth.signIn(
            withEmail: email,
            password: password
        ) { result, error in
            if error != nil {
                handler(String(describing: error))
                return
            }
            handler(String(describing: result))
        }
    }
    
    private func uploadImage(_ image: UIImage?, handler: @escaping (String) -> Void) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let imageData = image?.jpegData(compressionQuality: 0.8) else { return }
        
        let reference = FirebaseManager.shared.storage.reference(withPath: uid)
        reference.putData(imageData) { _, error in
            if let error = error {
                handler(String(describing: error))
                return
            }
            reference.downloadURL { url, error in
                if let error = error {
                    handler(String(describing: error))
                    return
                }
                handler(String(describing: url))
            }
        }
    }
}


enum CustomErrorDescription: Error {
    static let signUpError = "Could not create a new user. Please try again."
    static let signInError = "Could not sign in. Please try again."
}
