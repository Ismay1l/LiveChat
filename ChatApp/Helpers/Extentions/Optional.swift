//
//  Optional.swift
//  ChatApp
//
//  Created by Ismayil Ismayilov on 5/21/24.
//

import Foundation

extension Optional where Wrapped == String {
    
    var isNilOrEmpty: String {
        return self ?? ""
    }
}
