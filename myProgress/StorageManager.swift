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
    
    let storage = Storage.storage()
}
