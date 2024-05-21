//
//  FirebaseAuth.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/21/24.
//

import Foundation
import Firebase

class FirebaseAuth {
    static let shared = FirebaseAuth()
    private init() {}
    
    func createAccount(_ email: String, _ password: String, handler: @escaping (Error?) -> Void) {
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) { result, error in
            if error != nil {
                handler(error)
            }
        }
    }
    
    func login(_ email: String, password: String, handler: @escaping (Error?) -> Void) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { result, error in
            if error != nil {
                handler(error)
            }
        }
    }
}


enum CustomErrorDescription: Error {
    static let signUpError = "Could not create a new user. Please try again."
    static let signInError = "Could not sign in. Please try again."
}
