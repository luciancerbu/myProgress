//
//  StorageManager.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    let storage = Storage.storage().reference()
    
    public func uploadProfilePicture(username: String, data: Data?, completion: @escaping (Bool) -> Void) {
        guard let data = data else { return }
        storage.child("\(username)/profile_picture.png").putData(data, metadata: nil, completion: { _, error in
            completion(error == nil)
        })
    }
}
