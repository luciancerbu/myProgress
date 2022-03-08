//
//  DatabaseManager.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    let database = Firestore.firestore()
    
    public func findUser(with email: String, completion: @escaping (User?) -> Void) {
        let reference = database.collection("users")
        reference.getDocuments { snapshot, error in
            guard let users = snapshot?.documents.compactMap({ User(with: $0.data()) }),
                  error == nil else { return }
            
            let user = users.first(where: { $0.email == email })
            completion(user)
        }
    }
    
    public func createUser(newUser: User, completion: @escaping (Bool) -> Void) {
        let reference = database.document("users/\(newUser.username)")
        guard let data = newUser.asDictionary() else {
            completion(false)
            return
        }
        reference.setData(data) { error in
            completion(error == nil)
        }
    }
}
