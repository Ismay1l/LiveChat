//
//  FirebaseManager.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/21/24.
//

import Foundation
import Firebase
import FirebaseStorage

final class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
    }
}
