//
//  AuthManager.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import FirebaseAuth
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let auth = Auth.auth()
}
