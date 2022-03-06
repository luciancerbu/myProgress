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
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func signIn(email:String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
    public func signUp(email:String, password: String, profilePicture: Data?, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
    public func signOut(completion: @escaping (Bool) -> Void) {
        
    }
}
